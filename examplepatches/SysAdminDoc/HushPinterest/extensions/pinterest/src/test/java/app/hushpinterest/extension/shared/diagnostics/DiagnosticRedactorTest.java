/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.hushpinterest.extension.shared.diagnostics;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A person's name has no shape a pattern can find, and the toast that carries it is written to
 * the buffer in whichever language the phone speaks. The bundle marks the name instead, with the
 * isolate pair {@link #label(String)} wraps it in, and the redactor finds the marks.
 */
public class DiagnosticRedactorTest {

    private static final String FSI = "⁨";
    private static final String PDI = "⁩";

    /**
     * What Hushfeed's VideoAuthor.label() wraps a name in, kept here so the redactor's contract is
     * tested without that class: one isolate run, with breaks flattened and any marks inside the
     * name dropped, or the bare words when there is nobody to name.
     */
    private static String label(String name) {
        if (name == null || name.isEmpty()) return "this account";
        StringBuilder flat = new StringBuilder(name.length() + 2).append('⁨');
        for (int at = 0; at < name.length(); at++) {
            char character = name.charAt(at);
            if (character == '⁨' || character == '⁩') continue;
            flat.append(character == '\n' || character == '\r' ? ' ' : character);
        }
        return flat.append('⁩').toString();
    }

    @Test public void theToastLineLosesTheNameAndKeepsTheAction() {
        String line = DiagnosticRedactor.redact("Showing toast: Hid posts from " + FSI + "Dana Q" + PDI);

        assertEquals("Showing toast: Hid posts from [name omitted]", line);
    }

    @Test public void theNameIsFoundByItsMarksInAnyLanguage() {
        String german = DiagnosticRedactor.redact(
                "Showing toast: " + FSI + "Dana Q" + PDI + " wird nicht mehr angezeigt");

        assertFalse("a name in a translated toast survived: " + german, german.contains("Dana Q"));
        assertTrue("the words around the name were lost: " + german,
                german.contains("[name omitted] wird nicht mehr angezeigt"));
    }

    @Test public void aHandleOrAnIdInsideTheMarksGoesWithThem() {
        String handle = DiagnosticRedactor.redact("Hidden " + FSI + "@dana.q" + PDI + " locally");
        String vanity = DiagnosticRedactor.redact("Unfollowed " + FSI + "dana.q.1987" + PDI);

        assertEquals("Hidden [name omitted] locally", handle);
        assertEquals("Unfollowed [name omitted]", vanity);
    }

    @Test public void aNameThatLostItsClosingMarkIsCutToTheEndOfItsLine() {
        String text = DiagnosticRedactor.redact("Hidden " + FSI + "Dana Q locally\nnext line");

        assertEquals("Hidden [name omitted]\nnext line", text);
    }

    /**
     * A display name is whatever the account chose, so it can carry a line break or a copy of
     * the marks themselves. Either one used to split the run and leave the rest of the name in
     * the report. The label takes both out, so what arrives here is one run.
     */
    @Test public void aNameCarryingABreakOrTheMarksThemselvesIsStillOneRun() {
        String broken = label("Dana\nSecretHandle");
        String nested = label("A" + PDI + "B" + FSI + "C");

        assertEquals("Showing toast: Hid [name omitted]",
                DiagnosticRedactor.redact("Showing toast: Hid " + broken));
        assertEquals("Showing toast: Hid [name omitted]",
                DiagnosticRedactor.redact("Showing toast: Hid " + nested));
        assertFalse("half the name survived the break: " + broken,
                DiagnosticRedactor.redact(broken).contains("SecretHandle"));
        assertFalse("the middle of the name survived its own marks: " + nested,
                DiagnosticRedactor.redact(nested).contains("B"));
    }

    /**
     * The control for the pair above. Without the flattening the same two names leak, which is
     * what makes the flattening the thing being tested rather than the pattern.
     */
    @Test public void theSameTwoNamesLeakWhenTheyAreNotFlattenedFirst() {
        String rawBreak = FSI + "Dana\nSecretHandle" + PDI;
        String rawNested = FSI + "A" + PDI + "B" + FSI + "C" + PDI;

        assertTrue(DiagnosticRedactor.redact(rawBreak).contains("SecretHandle"));
        assertTrue(DiagnosticRedactor.redact(rawNested).contains("B"));
    }

    @Test public void anAccountWithNothingToNameIsNotHiddenAtAll() {
        // "this account" names nobody, so hiding it says less than the truth.
        assertEquals("Hid this account", DiagnosticRedactor.redact("Hid " + label(null)));
    }

    @Test public void aHandleOnItsOwnGoesWhileAnEmailAndAnObjectHashStay() {
        String text = DiagnosticRedactor.redact(
                "@dana.q wrote to dana@example.com from Foo@1a2b3c and mentioned @dana_q2");

        assertEquals("[handle omitted] wrote to dana@example.com from Foo@1a2b3c"
                + " and mentioned [handle omitted]", text);
    }

    /**
     * A handle glued to a character outside ASCII goes after every other rule. Taken first, it took
     * the name out of a credential, an id or a host and left the value, path or signature behind.
     * A handle on its own, or after ASCII, goes first as before.
     */
    @Test public void aHandleGluedToALetterOutsideAsciiGoesAfterTheNameItHolds() {
        assertEquals("é[handle omitted]=[omitted]", DiagnosticRedactor.redact("é@token=x1"));
        assertEquals("josé@[host omitted]", DiagnosticRedactor.redact("josé@pinterest.com/dana.q.1987"));
        assertEquals("ユーザー[handle omitted] をブロック", DiagnosticRedactor.redact("ユーザー@dana_q をブロック"));
        assertEquals("[handle omitted] said hi to [handle omitted]",
                DiagnosticRedactor.redact("@dana.q said hi to @dana_q2"));
    }

    /**
     * An ASCII @ with nothing in front of it also goes first, before the credential and id rules,
     * so @token, @access_token, @sessionid and @user_id took the name for a handle and left the value
     * behind: [handle omitted]=secret. An ordinary handle naming nothing the redactor knows still
     * goes first as before, credential or not.
     */
    @Test public void aHandleNamingACredentialOrIdGoesAfterTheNameItHolds() {
        assertEquals("[handle omitted]=[omitted]", DiagnosticRedactor.redact("@token=asciiHandleH13"));
        assertEquals("[handle omitted]=[omitted]", DiagnosticRedactor.redact("@access_token=EAABasciiHandleH14"));
        assertEquals("[handle omitted]=[omitted]", DiagnosticRedactor.redact("@sessionid=asciiHandleH15"));
        assertEquals("[handle omitted]=[omitted]", DiagnosticRedactor.redact("@user_id=asciiHandleH16"));
        assertEquals("thanks [handle omitted] for the tip",
                DiagnosticRedactor.redact("thanks @dana.q for the tip"));
        assertEquals("mentioned [handle omitted]", DiagnosticRedactor.redact("mentioned @threads"));
    }

    @Test public void thePostReferenceLineKeepsThePseudonymAndDropsThePostId() {
        String line = DiagnosticRedactor.redact(
                "Hidden ad: author 3f9a2c1b0e7d media_id=3456789012345678901");

        assertTrue("the pseudonym is what makes two lines comparable: " + line,
                line.contains("author 3f9a2c1b0e7d"));
        assertFalse("the post id names what was read: " + line,
                line.contains("3456789012345678901"));
    }

    @Test public void pinterestHostsAndSessionCookiesGo() {
        String line = DiagnosticRedactor.redact(
                "GET i.pinimg.com/originals/ab/cd/PinXYZ.jpg and v1.pinimg.com/videos/PinABC.mp4"
                        + " from api.pinterest.com/v3/users/me/ cookie ds_user_id=100012345678901;"
                        + " sessionid=100012345678901%3AsessQ1%3A12; csrftoken=csrfQ2 mid=midQ3; ig_did=igDidQ4");

        assertTrue("the line should still read as a request: " + line, line.startsWith("GET "));
        assertFalse("the image host survived: " + line, line.contains("PinXYZ"));
        assertFalse("the video host survived: " + line, line.contains("v1.pinimg"));
        assertFalse("the API host survived: " + line, line.contains("users/me"));
        assertFalse("the account id cookie survived: " + line, line.contains("100012345678901"));
        assertFalse("the session cookie survived: " + line, line.contains("sessQ1"));
        assertFalse("the request token cookie survived: " + line, line.contains("csrfQ2"));
        assertFalse("the machine id cookie survived: " + line, line.contains("midQ3"));
        assertFalse("the device id cookie survived: " + line, line.contains("igDidQ4"));
    }

    /**
     * rur and mid are too short to look for inside a word, so they only count as a whole name. A
     * setting or word that starts or ends the same way keeps its value, and the cookies themselves
     * don't.
     */
    @Test public void rurAndMidCountOnlyAsAWholeName() {
        String cookies = DiagnosticRedactor.redact("rur=rurWholeQ5; mid=midWholeQ6");
        assertFalse("the rur cookie survived: " + cookies, cookies.contains("rurWholeQ5"));
        assertFalse("the mid cookie survived: " + cookies, cookies.contains("midWholeQ6"));

        String ordinary = "pyramid=3 midnight=on amid: 2 rurality=4 mid_roll=off";
        assertEquals(ordinary, DiagnosticRedactor.redact(ordinary));
    }

    /**
     * A Pinterest address with no scheme and no subdomain. The host rule asked for a subdomain
     * before, so "pin.it/dana_q" reached the report as written while the same address with "www."
     * in front of it was caught.
     */
    @Test public void aPinterestHostGoesWithOrWithoutASubdomain() {
        assertEquals("opened [host omitted] and [host omitted]", DiagnosticRedactor.redact(
                "opened pin.it/dana_q and www.pin.it/dana_q"));
        assertEquals("[host omitted] then [host omitted]",
                DiagnosticRedactor.redact("pinterest.com/dana_q/1234 then pinterest.co.uk/dana_q"));
        assertEquals("[host omitted] then [host omitted] and [host omitted]", DiagnosticRedactor.redact(
                "pin.it:443/dana then de.pinterest.com and i.pinimg.com/originals/ab/PinXYZ.jpg"));
        assertEquals("cookie domain=.[host omitted]; path=/",
                DiagnosticRedactor.redact("cookie domain=.pinterest.com; path=/"));
    }

    /**
     * What only looks like a Pinterest address: the package and class names a report prints, and
     * names that start the same way and go on. They're what a maintainer reads a report for.
     */
    @Test public void aNameThatOnlyLooksLikeAPinterestHostStays() {
        String[] lines = {
                "app: com.pinterest 14.25.0 (14258020)",
                "at com.pinterest.ui.grid.PinterestRecyclerView.onLayout(PinterestRecyclerView.java:12)",
                "at com.pinterest.activity.PinterestActivity.onCreate(PinterestActivity.java:40)",
                "at com.pinterest.camera.CameraView.start(CameraView.java:9)",
                "at com.pinterest.Thread.run(Thread.java:1012)",
                "notpinterest.com/page and pin.items/page and mypinterest.company",
                "HushPinterest: hid 3 sponsored messages",
        };
        for (String line : lines) assertEquals(line, DiagnosticRedactor.redact(line));
    }

    @Test public void aBareAccountIdGoesAndATimestampStays() {
        String line = DiagnosticRedactor.redact("Hidden 100012345678901 at 1790000000000");

        assertEquals("Hidden [id omitted] at 1790000000000", line);
    }

    /**
     * A CDN file name joins its ids with underscores, and an underscore is a word character, so a
     * rule bounded by word edges never saw them. The middle number is the photo's own id.
     */
    @Test public void idsJoinedByUnderscoresInAFileNameGo() {
        String line = DiagnosticRedactor.redact(
                "saving image 475148478_1134540631592283_1316146539584337463_n.jpg and id1234567890123456x");

        assertEquals("saving image 475148478_[id omitted]_[id omitted]_n.jpg and id[id omitted]x", line);
    }

    /** The mutation control: a line with no name, handle or id is returned as it came. */
    @Test public void aLineWithNothingToHideIsLeftAlone() {
        String line = "Removed 3 of 12 feed units (maxsize=40, boxes=2) for author 3f9a2c1b0e7d";

        assertEquals(line, DiagnosticRedactor.redact(line));
    }

    /**
     * Synthetic credentials in the shapes a network, JSON or header dump prints them: quoted and
     * escaped keys, nested objects, JSON inside a JSON string, odd casing and separators, cookie
     * headers and whole Authorization values, one of them split over two lines. Each line is
     * followed by the secrets it carries, and every secret is a string nothing else here holds,
     * so a survivor is named in the failure.
     */
    /** A quote written as a JSON unicode escape, backslash u 0022, built so no tool decodes it. */
    private static final String U = "\\" + "u0022";

    /**
     * Credential names that run into other words, and Pinterest's named identifiers. Each goes into
     * the corpus in every form a report prints a name in, including a HAR pair and a nested object.
     */
    private static final String[] NAMES_IN_EVERY_FORM = {
            "authentication", "Authentication", "X-Authentication", "Authentication-Info", "authenticator",
            "authkey", "AUTHKEY", "authcode", "mfa_authcode", "authdata", "authinfo", "authhash", "authn", "authz",
            "basicauth", "preauth", "reauth", "userauth", "proxyauth", "twofactorauth", "igauth",
            "IGAuth", "XAuth", "HTTPAuth", "IGUID", "DEVICEGUID",
            "ssid", "SSID", "igsid", "asid", "SAPISID", "APISID", "HSID", "LSID", "__Secure-3PSID",
            "iguid", "cuid", "igiid", "deviceguid",
            "pin_id", "pinId", "pin-id", "board_id", "boardId", "board-id",
            "section_id", "sectionId", "section-id", "conversation_id", "conversationId", "conversation-id",
            "access_hash", "accessHash", "access-hash", "phone", "phone_number", "phoneNumber", "phone-number",
    };

    /** A no-break space, the long s and the Kelvin sign, built from code points so no editor swaps them. */
    private static final String NBSP = String.valueOf((char) 0xA0);
    private static final String LONG_S = String.valueOf((char) 0x17F);
    private static final String KELVIN = String.valueOf((char) 0x212A);
    /** An account id in Arabic-Indic digits, the way some languages print a number. */
    private static final String ARABIC_INDIC_ID = inDigitsFrom(0x660, "100012345678901");

    /** Short numeric values prove these names are hidden without relying on the bare 15-digit rule. */
    public static final String PINTEREST_EXPORT_PROBE =
            "Pinterest probe pin_id=81027031 boardId=-81027032 section_id=81027033 conversation_id=-10081027034"
                    + " access_hash=7810234567890 phone=+1 (602) 555-0173"
                    + " link=pinterest://board/pinterestProbePrivate"
                    + " app_version=14.25.0 version_code=14258020 timestamp=1790000000000 retries=3 counter=8";
    public static final String PINTEREST_EXPORT_REDACTED =
            "Pinterest probe pin_id=[omitted] boardId=[omitted] section_id=[omitted] conversation_id=[omitted]"
                    + " access_hash=[omitted] phone=[omitted] link=[url omitted]"
                    + " app_version=14.25.0 version_code=14258020 timestamp=1790000000000 retries=3 counter=8";

    public static final String[][] CREDENTIAL_CORPUS = inEveryForm(NAMES_IN_EVERY_FORM, new String[][]{
            {"{\"access_token\":\"EAABjsonKeyA1\",\"locale\":\"en_US\"}", "EAABjsonKeyA1"},
            {"{\"data\":{\"viewer\":{\"session\":{\"sessionid\":\"sessNestB2\",\"uid\":\"77\"}}}}", "sessNestB2"},
            {"{\"auth\":{\"tokens\":{\"access\":\"deepAccessC3\",\"refresh\":\"deepRefreshC4\"}}}",
                    "deepAccessC3", "deepRefreshC4"},
            {"body=\"{\\\"access_token\\\":\\\"EAABescapedD5\\\",\\\"post_id\\\":\\\"4242\\\"}\"",
                    "EAABescapedD5", "4242"},
            {"body={\\\\\\\"password\\\\\\\":\\\\\\\"twiceEscapedE6\\\\\\\"}", "twiceEscapedE6"},
            {"{'password': 'correct horse battery'}", "horse", "battery"},
            {"\"PassWord\" : \"p\\\"ss w0rdF7\"", "w0rdF7"},
            {"ACCESS-TOKEN=EAABcasingG8.", "EAABcasingG8"},
            {"accessToken => 'arrowTokenH9'", "arrowTokenH9"},
            {"csrftoken%3AcsrfEncodedI10%26next", "csrfEncodedI10"},
            {"Cookie: ds_user_id=100012345678901; sessionid=100012345678901%3AsessCookieJ11%3A12; csrftoken=csrfCookieJ12; mid=midCookieJ13; ig_did=igDidCookieJ14",
                    "100012345678901", "sessCookieJ11", "csrfCookieJ12", "midCookieJ13", "igDidCookieJ14"},
            {"set-cookie: rur=rurSetCookieK15; expires=Sat, 26-Dec-2026 12:00:00 GMT; Max-Age=31536000; secure",
                    "rurSetCookieK15"},
            {"{\"cookies\":[{\"name\":\"sessionid\",\"value\":\"sessListL16\"},{\"name\":\"mid\",\"value\":\"midListL17\"}]}",
                    "sessListL16", "midListL17"},
            {"Authorization: Bearer EAABbearerM18", "EAABbearerM18"},
            {"authorization: Basic dXNlcjpiYXNpY1NlY3JldE4xOQ==", "dXNlcjpiYXNpY1NlY3JldE4xOQ=="},
            {"AUTHORIZATION: Bearer\n    EAABfoldedO20", "EAABfoldedO20"},
            {"Authorization:\nOAuth EAABnextLineP21", "EAABnextLineP21"},
            {"{\"Authorization\":\"OAuth EAABquotedQ22\",\"x-fb-friendly-name\":\"FeedQuery\"}", "EAABquotedQ22"},
            {"Proxy-Authorization: Basic cHJveHlTZWNyZXRSMjM=", "cHJveHlTZWNyZXRSMjM="},
            {"retrying with Bearer EAABbareS24 after 401", "EAABbareS24"},
            {"{\"authorization\":\"Bearer\\nEAABjsonBreakT25\"}", "EAABjsonBreakT25"},
            // What a review found still leaking, one row each.
            {"{\"name\":\"Authorization\",\"value\":\"Basic dXNlcjpsZWFrQmFzaWMx\"}", "dXNlcjpsZWFrQmFzaWMx"},
            {"{\"name\":\"rur\",\"value\":\"CLN%2CrurPairLeak\"}", "rurPairLeak"},
            {"Authorization -> Basic dXNlcjpsZWFrQXJyb3c=", "dXNlcjpsZWFrQXJyb3c="},
            {"retried with Basic dXNlcjpiYXJlQmFzaWM5", "dXNlcjpiYXJlQmFzaWM5"},
            {"{\"auth\":{\"a\":{\"b\":{\"c\":{\"access\":\"leakDeep4\"}}}}}", "leakDeep4"},
            {"{\"auth\":{\"hint\":\"}\",\"access\":\"leakBrace\"}}", "leakBrace"},
            {U + "access_token" + U + ":" + U + "EAABuniLeak" + U, "EAABuniLeak"},
            {"&quot;access_token&quot;:&quot;EAABhtmlLeak&quot;", "EAABhtmlLeak"},
            {"{\"api_key\":\"apiKeyLeak7\"}", "apiKeyLeak7"},
            {"{\"pwd\":\"pwdLeak8\"}", "pwdLeak8"},
            {"advertising_id=adIdLeak9", "adIdLeak9"},
            {"X-IG-Device-ID: deviceIdLeak10", "deviceIdLeak10"},
            {"{\"token \": \"spaceKeyLeak\"}", "spaceKeyLeak"},
            {"Authorization: Bearer EAABfirstHalf\nsecondHalfLeak", "EAABfirstHalf", "secondHalfLeak"},
            {"password=p@ss;w0rdSemiLeak", "w0rdSemiLeak"},
            {"password=staple spaced unquotedPassLeak", "staple", "unquotedPassLeak"},
            // An account id under any spelling of user id, however short.
            {"user_id=userIdLeakV1&next=1", "userIdLeakV1"},
            {"userid: useridLeakV2", "useridLeakV2"},
            {"{\"userId\":\"camelUserIdLeakV3\",\"kind\":\"reel\"}", "camelUserIdLeakV3"},
            {"X-User-Id: headerUserIdLeakV4", "headerUserIdLeakV4"},
            // Account ids as a list, an object, a HAR-style pair, in angle brackets, spaced or plural.
            {"{\"userId\":[\"arrayFirstV5\",\"arraySecondV6\"]}", "arrayFirstV5", "arraySecondV6"},
            {"{\"user_id\":{\"id\":\"objectInnerV7\"}}", "objectInnerV7"},
            {"{\"name\":\"X-User-Id\",\"value\":\"harPairV8\"}", "harPairV8"},
            {"{\"name\":\"user_id\",\"value\":\"harSnakeV9\"}", "harSnakeV9"},
            {"user_id=<angleBracketV10>", "angleBracketV10"},
            {"user_id: spacedFirstV11 spacedSecondV12", "spacedFirstV11", "spacedSecondV12"},
            {"user_ids=pluralFirstV13,pluralSecondV14", "pluralFirstV13", "pluralSecondV14"},
            {"userIds: [\"pluralArrayV15\"]", "pluralArrayV15"},
            {"User-Ids: spacedPluralV16 spacedPluralV17", "spacedPluralV16", "spacedPluralV17"},
            {"body=\"{\\\"userId\\\":[\\\"escapedArrayV18\\\"]}\"", "escapedArrayV18"},
            // Every other id name as a HAR-style pair, a list or an object.
            {"{\"name\":\"story_id\",\"value\":\"storyPairV19\"}", "storyPairV19"},
            {"{\"name\":\"postId\",\"value\":\"postPairV20\"}", "postPairV20"},
            {"{\"post_id\":[\"postArrayV21\"]}", "postArrayV21"},
            {"{\"feedback_id\":{\"id\":\"feedbackObjectV22\"}}", "feedbackObjectV22"},
            // Pinterest identifiers are often shorter than a timestamp, and dialog/channel ids
            // can carry a minus sign. The field name, rather than a number's length, hides them.
            {PINTEREST_EXPORT_PROBE, "81027031", "81027032", "81027033", "10081027034",
                    "7810234567890", "555-0173", "pinterestProbePrivate"},
            {"pinId: 81027035", "81027035"},
            {"board_id=-10081027036", "10081027036"},
            {"sectionId => '81027037'", "81027037"},
            {"conversationId -> -10081027038", "10081027038"},
            {"accessHash=7810234567891 next=1", "7810234567891"},
            {"phone_number=+12025550174 retries=3", "12025550174"},
            {"phoneNumber=(313) 555 0175 retries=3", "555 0175"},
            {"phone=+1" + NBSP + "(480)" + NBSP + "555-0176 retries=3", "555-0176"},
            {"body=\"{\\\"pin_id\\\":\\\"81027039\\\",\\\"counter\\\":8}\"", "81027039"},
            {U + "boardId" + U + ":" + U + "81027040" + U, "81027040"},
            {"&quot;section_id&quot;:&quot;81027041&quot;", "81027041"},
            {"%22conversationId%22%3A%22-10081027042%22", "10081027042"},
            {"body={\\\\\\\"access_hash\\\\\\\":\\\\\\\"7810234567892\\\\\\\"}", "7810234567892"},
            {"\"phone\":\"+1 (520) 555-0177\"", "555-0177"},
            {"яpin_id=81027043", "81027043"},
            {"猫boardId: {\"id\":\"pinterestDialogObject\"}", "pinterestDialogObject"},
            {"é@section_id=81027044", "81027044"},
            {"@conversation_id=-10081027045", "10081027045"},
            {"@access_hash=7810234567893", "7810234567893"},
            {"@phone=+1 (928) 555-0178", "555-0178"},
            {"acce" + LONG_S + LONG_S + "_hash=7810234567894", "7810234567894"},
            {"section_id=" + inDigitsFrom(0x660, "81027046"), inDigitsFrom(0x660, "81027046")},
            {"phone=+" + inDigitsFrom(0x660, "12025550179"), inDigitsFrom(0x660, "12025550179")},
            {"opened pinterest://board/pinterestShortBoard/81027047#pinterestShortFragment",
                    "pinterestShortBoard", "81027047", "pinterestShortFragment"},
            {"PINTEREST://share?phone=%2B12025550180&text=pinterestShortText", "12025550180", "pinterestShortText"},
            {"épinterest://pin/pinterestUnicodeLink", "pinterestUnicodeLink"},
            {"e̋pinterest://pin/pinterestCombiningLink", "pinterestCombiningLink"},
            {"pinterest://search/pins?q=pinterestNbspFirst" + NBSP + "pinterestNbspSecond",
                    "pinterestNbspFirst", "pinterestNbspSecond"},
            {"body=\"{\\\"url\\\":\\\"pinterest://pin/pinterestEscapedLink\\\"}\"", "pinterestEscapedLink"},
            {"opened https://pin.it/pinterestExistingLink", "pinterestExistingLink"},
            // sid, uid, iid, guid and auth at a name's edge, in any case, and the longer names that
            // hold one of them with no edge.
            {"sid=sidLeakA1", "sidLeakA1"},
            {"{\"uid\":\"uidLeakA2\"}", "uidLeakA2"},
            {"x-ig-iid: iidLeakA3", "iidLeakA3"},
            {"auth=authLeakA4", "authLeakA4"},
            {"ig_sid=igSidLeakA5", "igSidLeakA5"},
            {"user-uid: userUidLeakA6", "userUidLeakA6"},
            {"auth_token=authTokenLeakA7", "authTokenLeakA7"},
            {"X-AUTH: xAuthLeakA8", "xAuthLeakA8"},
            {"userAuth=camelAuthLeakA9", "camelAuthLeakA9"},
            {"accountSid: \"camelSidLeakA10\"", "camelSidLeakA10"},
            {"sid2=digitSidLeakA11", "digitSidLeakA11"},
            {"authorization=authorizationLeakA12", "authorizationLeakA12"},
            {"x_authorization: xAuthorizationLeakA13", "xAuthorizationLeakA13"},
            {"session_id=sessionIdLeakA14", "sessionIdLeakA14"},
            {"access_token=accessTokenLeakA16", "accessTokenLeakA16"},
            {"ds_user_id=dsUserLeakA17", "dsUserLeakA17"},
            {"ig_did=igDidLeakA18", "igDidLeakA18"},
            {"x-ig-device-id: deviceIdLeakA19", "deviceIdLeakA19"},
            {"X-IG-Android-ID: android-androidIdLeakA32", "androidIdLeakA32"},
            {"{\"authorization\":{\"scheme\":\"x\",\"secret\":\"authObjLeakA20\"}}", "authObjLeakA20"},
            {"{\"auth\":{\"hint\":\"a\",\"value\":\"authObjLeakA21\"}}", "authObjLeakA21"},
            {"SID=upperSidLeakA22", "upperSidLeakA22"},
            {"guid=guidLeakA23", "guidLeakA23"},
            {"device_guid: devGuidLeakA24", "devGuidLeakA24"},
            {"PHPSESSID=phpLeakA25", "phpLeakA25"},
            {"uuid=uuidLeakA26", "uuidLeakA26"},
            {"device_uuid=devUuidLeakA27", "devUuidLeakA27"},
            {"oauth_verifier=oauthLeakA28", "oauthLeakA28"},
            // An ordinary word that goes on into more of a name is no longer that word.
            {"authorId=authorIdLeakA29", "authorIdLeakA29"},
            {"inside_sid: insideSidLeakA30", "insideSidLeakA30"},
            {"{\"guideUid\":\"guideUidLeakA31\"}", "guideUidLeakA31"},
            // Glued to a letter outside ASCII, which Android's regex engine counts as part of the word.
            {"étoken=nonAsciiTokenW1", "nonAsciiTokenW1"},
            {"Ücookie: nonAsciiCookieW2", "nonAsciiCookieW2"},
            {"naïvepassword=nonAsciiPassW3", "nonAsciiPassW3"},
            {"ésid: nonAsciiSidW4", "nonAsciiSidW4"},
            {"éauthorization: Digest nonAsciiDigestW5", "nonAsciiDigestW5"},
            {"ñbearer EAABnonAsciiW6", "EAABnonAsciiW6"},
            {"яpost_id=nonAsciiPostW7", "nonAsciiPostW7"},
            {"çuser_id=nonAsciiUserW8", "nonAsciiUserW8"},
            {"猫access_token: {\"a\":\"nonAsciiBlockW9\"}", "nonAsciiBlockW9"},
            {"éhttps://example.com/nonAsciiUrlW10", "nonAsciiUrlW10"},
            {"éi.pinimg.com/nonAsciiHostW11", "nonAsciiHostW11"},
            {"at api.pinterest.comé", "api.pinterest"},
            {"é@nonAsciiHandleW12", "nonAsciiHandleW12"},
            // An e followed by a combining double acute, which the JDK's \b also took for part of the word.
            {"e̋token=combiningMarkW13", "combiningMarkW13"},
            // Spaces, digits and letters Android's engine reads another way than the JDK's.
            {"access_token=nbspFirstX1" + NBSP + "nbspSecondX2", "nbspFirstX1", "nbspSecondX2"},
            {"https://example.com/a" + NBSP + "nbspUrlX3", "nbspUrlX3"},
            {"token:" + NBSP + "nbspAfterSeparatorX4", "nbspAfterSeparatorX4"},
            {"seen " + ARABIC_INDIC_ID, ARABIC_INDIC_ID},
            {LONG_S + "ecret=longSX5", "longSX5"},
            {"paßword=sharp spaced X6", "sharp spaced X6"},
            {"to" + KELVIN + "en=kelvinX7", "kelvinX7"},
            {"in" + (char) 0xFB06 + "all_id=ligatureX8", "ligatureX8"},
            // An @ glued to a character outside ASCII in front of a name, a host or a CDN address.
            {"é@token=gluedTokenH1", "gluedTokenH1"},
            {"é@access_token=EAABgluedH2", "EAABgluedH2"},
            {"é@sessionid=gluedSessionH3", "gluedSessionH3"},
            {"я@user_id=gluedUserIdH4", "gluedUserIdH4"},
            {"josé@pinterest.com/gluedPathH5", "gluedPathH5"},
            {"Ошибка@i.pinimg.com/originals/PinXYZ.jpg?oh=00_gluedOhH6&oe=gluedOeH7", "gluedOhH6", "gluedOeH7"},
            {"日@mid=gluedMidH8", "gluedMidH8"},
            {"٣@sid=gluedDigitH9", "gluedDigitH9"},
            {new String(Character.toChars(0x20000)) + "@token=gluedSupplementaryH10", "gluedSupplementaryH10"},
            {LONG_S + "@token=gluedLongSH11", "gluedLongSH11"},
            {"ユーザー@gluedHandleH12 をブロック", "gluedHandleH12"},
            // An @ with nothing in front of it, in front of a name the redactor knows.
            {"@token=asciiHandleH13", "asciiHandleH13"},
            {"@access_token=asciiHandleH14", "asciiHandleH14"},
            {"@sessionid=asciiHandleH15", "asciiHandleH15"},
            {"@user_id=asciiHandleH16", "asciiHandleH16"},
    });

    @Test public void pinterestFieldsHideShortValuesAndKeepTheFollowingBuildData() {
        assertEquals(PINTEREST_EXPORT_REDACTED, DiagnosticRedactor.redact(PINTEREST_EXPORT_PROBE));
    }

    @Test public void formattedPhoneValuesStopBeforeTheNextField() {
        assertEquals("phone=[omitted] retries=3 timestamp=1790000000000\nphoneNumber=[omitted] counter=8",
                DiagnosticRedactor.redact("phone=+1 (602) 555-0181 retries=3 timestamp=1790000000000\n"
                        + "phoneNumber=(313) 555 0182 counter=8"));
        assertEquals("phone=[omitted] retries=3",
                DiagnosticRedactor.redact("phone=+1" + NBSP + "(480)" + NBSP + "555-0183 retries=3"));
    }

    @Test public void pinterestLinksHaveBothFormsAndKeepTheirAsciiBoundaries() {
        assertEquals("opened [url omitted] and [url omitted] retries=3",
                DiagnosticRedactor.redact("opened pinterest://pin/pinterestShortLink"
                        + " and https://pin.it/pinterestLongLink retries=3"));
        String ordinary = "pinterest:status=3 pinterest_status=ready app=14.25.0 timestamp=1790000000000";
        assertEquals(ordinary, DiagnosticRedactor.redact(ordinary));
    }

    @Test public void pinterestFieldNamesDoNotHideCountersOrUnrelatedPhoneWords() {
        String ordinary = "board_count=3 boardId_count=4 pinCount=5 section_count=6 conversationCount=7"
                + " access_hash_count=8 accessHashCount=9 phoneCount=10 phone_number_length=11"
                + " headphone=12 microphone=13 phonebook=14 version=14.25.0 timestamp=1790000000000";
        assertEquals(ordinary, DiagnosticRedactor.redact(ordinary));
    }

    /** The digits of [ascii] written from the zero at [zero] on, as another script writes them. */
    private static String inDigitsFrom(int zero, String ascii) {
        StringBuilder digits = new StringBuilder(ascii.length());
        for (int at = 0; at < ascii.length(); at++) digits.append((char) (zero + ascii.charAt(at) - '0'));
        return digits.toString();
    }

    /**
     * The rows, then each name as name=, as a header, in upper case, as a JSON key, as the name of
     * a HAR-style pair and holding a whole object. Every secret carries its name's index and form.
     */
    private static String[][] inEveryForm(String[] names, String[][] rows) {
        List<String[]> all = new ArrayList<>(Arrays.asList(rows));
        for (int at = 0; at < names.length; at++) {
            String name = names[at];
            String secret = "runTogether" + at + "Form";
            all.add(new String[]{name + "=" + secret + "A", secret + "A"});
            all.add(new String[]{name + ": " + secret + "B", secret + "B"});
            all.add(new String[]{name.toUpperCase(Locale.ROOT) + "=" + secret + "C", secret + "C"});
            all.add(new String[]{"{\"" + name + "\":\"" + secret + "D\"}", secret + "D"});
            all.add(new String[]{"{\"name\":\"" + name + "\",\"value\":\"" + secret + "E\"}", secret + "E"});
            all.add(new String[]{"{\"" + name + "\":{\"v\":\"" + secret + "F\"}}", secret + "F"});
        }
        return all.toArray(new String[0][]);
    }

    @Test public void noSyntheticCredentialSurvives() {
        StringBuilder leaks = new StringBuilder();
        for (String[] row : CREDENTIAL_CORPUS) {
            String redacted = DiagnosticRedactor.redact(row[0]);
            for (int i = 1; i < row.length; i++) {
                if (redacted.contains(row[i])) {
                    leaks.append('\n').append(row[i]).append(" survived in: ").append(redacted);
                }
            }
        }
        assertEquals("", leaks.toString());
    }

    /** The same corpus as one block of text, the way it reaches the report: nothing leaks between lines. */
    @Test public void noSyntheticCredentialSurvivesInOneBlock() {
        StringBuilder block = new StringBuilder();
        for (String[] row : CREDENTIAL_CORPUS) block.append(row[0]).append('\n');
        String redacted = DiagnosticRedactor.redact(block.toString());
        for (String[] row : CREDENTIAL_CORPUS) {
            for (int i = 1; i < row.length; i++) {
                assertFalse(row[i] + " survived in:\n" + redacted, redacted.contains(row[i]));
            }
        }
    }

    /**
     * Short ids behind a quoted or camel-cased name. A post or story id of a few digits is too
     * short for the bare-number rule, so only its name gives it away.
     */
    @Test public void aShortIdGoesWhateverItsNameLooksLike() {
        assertEquals("{\"story_id=[omitted],\"kind\":\"reel\"}",
                DiagnosticRedactor.redact("{\"story_id\":\"7\",\"kind\":\"reel\"}"));
        assertEquals("postId=[omitted] shown", DiagnosticRedactor.redact("postId=12 shown"));
        assertEquals("{'feedback_id=[omitted]}", DiagnosticRedactor.redact("{'feedback_id': 'ZmVlZGJhY2s6MTI='}"));
        assertEquals("\\\"video_id=[omitted]}", DiagnosticRedactor.redact("\\\"video_id\\\":\\\"31\\\"}"));
        assertEquals("topLevelPostId=[omitted] kept", DiagnosticRedactor.redact("topLevelPostId: 42 kept"));
        assertEquals("post-id=[omitted] kept", DiagnosticRedactor.redact("post-id: 99 kept"));
    }

    /**
     * An account id is only caught by the bare-number rule when it's fifteen digits or more, so a
     * short or non-numeric one behind user_id reached the report. Its name gives it away. A word
     * after the id on its line goes with it, since it can't be told from a second id in a list
     * written with spaces.
     */
    @Test public void aUserIdGoesWhateverItsNameLooksLike() {
        assertEquals("user_id=[omitted]", DiagnosticRedactor.redact("user_id=abc kept"));
        assertEquals("userid=[omitted]", DiagnosticRedactor.redact("userid=abc kept"));
        assertEquals("{\"userId=[omitted]}", DiagnosticRedactor.redact("{\"userId\":\"a1b2\"}"));
        assertEquals("user-id=[omitted]", DiagnosticRedactor.redact("user-id: 42 kept"));
        assertEquals("USER_ID=[omitted]", DiagnosticRedactor.redact("USER_ID: 7 kept"));
    }

    /**
     * Account ids in the other shapes a report prints them in. The whole value goes, and the rest
     * of the line stays from the next name with a separator, or a closing quote or bracket.
     */
    @Test public void aListOrObjectOfAccountIdsGoesWhole() {
        assertEquals("{\"userId=[omitted]}", DiagnosticRedactor.redact("{\"userId\":[\"a\",\"b\"]}"));
        assertEquals("{\"userId=[omitted]}", DiagnosticRedactor.redact("{\"userId\":{\"id\":\"x\"}}"));
        assertEquals("{\"name\":\"X-User-Id\",\"value\":[omitted]}",
                DiagnosticRedactor.redact("{\"name\":\"X-User-Id\",\"value\":\"x\"}"));
        assertEquals("user_id=[omitted]", DiagnosticRedactor.redact("user_id=<x>"));
        assertEquals("user_id=[omitted]", DiagnosticRedactor.redact("user_id: a b"));
        assertEquals("user_ids=[omitted]", DiagnosticRedactor.redact("user_ids=a,b"));
        assertEquals("user_id=[omitted] action=hide, reason: spam",
                DiagnosticRedactor.redact("user_id=a b action=hide, reason: spam"));
        assertEquals("{\"userId=[omitted]\"kind\":\"reel\"}",
                DiagnosticRedactor.redact("{\"userId\":42,\"kind\":\"reel\"}"));
        assertEquals("(user_id=[omitted]) next", DiagnosticRedactor.redact("(user_id=7) next"));
    }

    /**
     * A header name with nothing after it on its line takes nothing from the next. A Java trace
     * printed after it keeps every frame and its Suppressed line.
     */
    @Test public void anEmptyHeaderValueTakesNoFrameFromTheNextLine() {
        String emptyCookie = "java.io.IOException: missing Cookie:\n"
                + "\tat app.Foo.bar(Foo.java:1)\n\tat app.Baz.q(Baz.java:2)";
        assertEquals("java.io.IOException: missing Cookie=[omitted]\n"
                + "\tat app.Foo.bar(Foo.java:1)\n\tat app.Baz.q(Baz.java:2)", DiagnosticRedactor.redact(emptyCookie));

        String emptyBearer = "failed with Authorization: Bearer\n\tat app.Foo.bar(Foo.java:1)";
        assertEquals("failed with Authorization=[omitted]\n\tat app.Foo.bar(Foo.java:1)",
                DiagnosticRedactor.redact(emptyBearer));

        String suppressed = "java.io.IOException: Cookie: sessionid=1\n"
                + "\tSuppressed: java.io.IOException: close failed\n\t\tat app.Foo.close(Foo.java:9)";
        assertEquals("java.io.IOException: Cookie=[omitted]\n"
                + "\tSuppressed: java.io.IOException: close failed\n\t\tat app.Foo.close(Foo.java:9)",
                DiagnosticRedactor.redact(suppressed));
    }

    /** A word after Bearer or OAuth is a credential only when it looks like one. */
    @Test public void anOrdinaryWordAfterBearerOrOAuthStays() {
        for (String line : new String[]{"OAuth callback received", "Bearer credentials expired",
                "Basic settings opened", "Basic authentication failed"}) {
            assertEquals(line, DiagnosticRedactor.redact(line));
        }
    }

    /** Shapes the rules already handled, kept that way. */
    @Test public void shapesThatAlreadyWorkedStayWorking() {
        assertEquals("Hide ads: invoked 3, 1 found, 0 missing",
                DiagnosticRedactor.redact("Hide ads: invoked 3, 1 found, 0 missing"));
        assertEquals("{ \"access_token=[omitted] }", DiagnosticRedactor.redact("{ \"access_token\" : \"EAABspaced12\" }"));
        assertEquals("access_token=[omitted]&next=1", DiagnosticRedactor.redact("access_token=EAABquery123&next=1"));
        assertEquals("Authorization=[omitted]", DiagnosticRedactor.redact("Authorization:Bearer EAABnospace12"));
        assertEquals("sent Bearer [omitted]", DiagnosticRedactor.redact("sent Bearer%20EAABpercent12"));
        assertEquals("app: com.pinterest 14.25.0 (14258020) at 1790000000000",
                DiagnosticRedactor.redact("app: com.pinterest 14.25.0 (14258020) at 1790000000000"));
    }

    /**
     * What the credential rules must leave: the report's build lines, timestamps, stack frames
     * (one of them from a class whose name contains "Auth"), ordinary settings and a sentence that
     * only uses the word Basic.
     */
    @Test public void buildDataTimestampsAndStackFramesStay() {
        String[] lines = {
                "app: com.pinterest 14.25.0 (14258020)",
                "abi: app arm64, process 64-bit, device arm64-v8a,armeabi-v7a",
                "morphe: 0.3.4",
                "generated_utc: 2026-09-28T12:00:00.000Z",
                "ads | 2026-09-28T12:00:01.234Z | main | Ads | INFO | hid 2 sponsored messages",
                "\tat app.hushpinterest.extension.pinterest.settings.ReleaseTransport.get(ReleaseTransport.java:120)",
                "\tat com.example.auth.login.AuthStateMachine.run(AuthStateMachine.java:44)",
                "Caused by: java.net.SocketTimeoutException: timeout=30000 attempts=3",
                "hide_paid_partnership=on, check_for_releases=on",
                "Basic settings opened",
        };
        for (String line : lines) assertEquals(line, DiagnosticRedactor.redact(line));
    }

    /**
     * sid, uid, iid, guid and auth are short enough to sit inside ordinary words, and the value
     * after such a word is often the fact a report is read for. Only the corpus rows above, where
     * the short name stands at an edge of its name, lose their value.
     */
    @Test public void anOrdinaryWordHoldingAShortCredentialNameKeepsItsValue() {
        String[] lines = {
                "inside: 3 rows",
                "guide=on",
                "author: 3f9a2c1b0e7d",
                "residual=12",
                "{\"inside\":\"kept\",\"authored\":\"kept too\"}",
                "fluid: true, liquid=2, consider: yes",
                "Author: reel, AUTHORITY=feed, sidebar=left, isAuthor: false",
                "guidance: short, misguided=no, fluidity=high",
                "{\"name\":\"inside\",\"value\":\"kept\"}",
                "authorized=true",
                "unauthorized=true",
                "authorize=allow",
                "considering=x",
                "reconsider=x",
                "insides: kept, residuals: kept, guiding=kept, authoring=kept",
        };
        for (String line : lines) assertEquals(line, DiagnosticRedactor.redact(line));
    }

    /**
     * Every ordinary word the redactor lets through, in each form a report prints a name in. Any
     * other name holding sid, uid, iid, guid or auth loses its value, so this is the whole list.
     */
    @Test public void everyListedOrdinaryWordKeepsItsValue() {
        String[] words = {"inside", "insides", "outside", "beside", "insider", "residual", "residuals", "residue",
                "consider", "considers", "considering", "considered", "reconsider", "president", "residence",
                "subsidy", "upside", "downside", "aside", "sidebar", "guide", "guided", "guides", "guiding",
                "guidance", "misguided", "fluid", "fluidity", "liquid", "squid", "druid", "author", "authors",
                "authored", "authoring", "authorize", "authorized", "authorizes", "authorizing", "unauthorized",
                "authority", "authorities", "isAuthor", "hasAuthority"};
        for (String word : words) {
            for (String line : new String[]{word + ": kept", word.toUpperCase(Locale.ROOT) + "=kept",
                    "{\"" + word + "\":\"kept\"}", "{\"name\":\"" + word + "\",\"value\":\"kept\"}",
                    "{\"" + word + "\":{\"v\":\"kept\"}}"}) {
                assertEquals(line, DiagnosticRedactor.redact(line));
            }
        }
    }

    /** An Authorization value ends at its line, so the stack trace printed after it stays. */
    @Test public void aStackTraceAfterAnAuthorizationLineStays() {
        String trace = "java.io.IOException: 401 for Authorization: Bearer EAABtraceU26\n"
                + "\tat app.hushpinterest.extension.pinterest.settings.ReleaseTransport.get(ReleaseTransport.java:120)\n"
                + "\tat java.lang.Thread.run(Thread.java:1012)";

        assertEquals("java.io.IOException: 401 for Authorization=[omitted]\n"
                + "\tat app.hushpinterest.extension.pinterest.settings.ReleaseTransport.get(ReleaseTransport.java:120)\n"
                + "\tat java.lang.Thread.run(Thread.java:1012)", DiagnosticRedactor.redact(trace));
    }

    /**
     * Android runs these rules on ICU, whose \b and \w take a letter such as é, я or 猫 for part of
     * a word. The JDK these tests run on doesn't, so étoken=secret lost its value here and kept it
     * on a phone. Edges spelled out in ASCII classes read the same on both engines, which is what
     * lets a result here stand for the phone.
     */
    @Test public void noRuleUsesAWordEdgeTheTwoEnginesDrawApart() throws IOException {
        File root = new File("").getAbsoluteFile();
        while (!new File(root, "settings.gradle.kts").isFile() || !new File(root, "gradlew").isFile()) {
            root = root.getParentFile();
        }
        String source = new String(Files.readAllBytes(new File(root, "extensions/shared/library/src/main/java/"
                + "app/hushpinterest/extension/shared/diagnostics/DiagnosticRedactor.java").toPath()), StandardCharsets.UTF_8);
        Matcher word = Pattern.compile(".*\\\\\\\\[bBwW].*").matcher(source);

        if (word.find()) fail("a rule leans on \\b or \\w, which ICU reads differently: " + word.group().trim());
    }

    /**
     * ICU's \s also takes a no-break space and its \d takes any script's digits, where the JDK's
     * take ASCII only, so on a phone a value holding a no-break space lost only its first part. The
     * rules spell spaces out in ASCII and write a digit as \p{Nd}, which both engines read alike.
     */
    @Test public void noRuleUsesASpaceOrDigitClassTheTwoEnginesReadApart() throws IOException {
        File root = new File("").getAbsoluteFile();
        while (!new File(root, "settings.gradle.kts").isFile() || !new File(root, "gradlew").isFile()) {
            root = root.getParentFile();
        }
        String source = new String(Files.readAllBytes(new File(root, "extensions/shared/library/src/main/java/"
                + "app/hushpinterest/extension/shared/diagnostics/DiagnosticRedactor.java").toPath()), StandardCharsets.UTF_8);
        Matcher shorthand = Pattern.compile(".*\\\\\\\\[sSdD].*").matcher(source);

        if (shorthand.find()) fail("a rule uses \\s or \\d, which ICU reads differently: " + shorthand.group().trim());
    }

    /**
     * A letter ICU folds into ASCII when it ignores case is read both ways on both engines: as the
     * letters it folds to, so ſecret is secret, and as an edge, like any letter outside ASCII, so
     * the aid in ſaid is still a name. The cost shows in the report: ß comes out as ss.
     */
    @Test public void aNameReadsTheSameWhateverLettersSpellIt() {
        assertEquals("secret=[omitted]", DiagnosticRedactor.redact(LONG_S + "ecret=x"));
        assertEquals("password=[omitted]", DiagnosticRedactor.redact("paßword=a b"));
        assertEquals("toKen=[omitted] next", DiagnosticRedactor.redact("to" + KELVIN + "en=x next"));
        assertEquals("said=[omitted] next", DiagnosticRedactor.redact(LONG_S + "aid=x next"));
        assertEquals("Grösse: 3 MB", DiagnosticRedactor.redact("Größe: 3 MB"));
    }

    /** A no-break space is part of a value, and an id in another script's digits is still an id. */
    @Test public void aNoBreakSpaceOrAnotherScriptsDigitsHideNothing() {
        assertEquals("access_token=[omitted] next", DiagnosticRedactor.redact("access_token=a" + NBSP + "b next"));
        assertEquals("seen [id omitted] at 1790000000000",
                DiagnosticRedactor.redact("seen " + ARABIC_INDIC_ID + " at 1790000000000"));
        assertEquals("Hidden " + inDigitsFrom(0x660, "3") + " rows",
                DiagnosticRedactor.redact("Hidden " + inDigitsFrom(0x660, "3") + " rows"));
    }
}
