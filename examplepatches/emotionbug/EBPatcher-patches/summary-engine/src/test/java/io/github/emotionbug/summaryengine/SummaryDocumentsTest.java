package io.github.emotionbug.summaryengine;

import static org.junit.Assert.*;
import java.io.IOException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

public final class SummaryDocumentsTest {
    private static JSONObject document(String text, String summary) throws Exception {
        return SummaryDocuments.empty().put("summary", summary).put("segments", new JSONArray()
                .put(new JSONObject().put("text", text).put("speaker", "Channel 1")
                        .put("startMs", 1250).put("endMs", 3800)));
    }
    private static JSONObject review(String choice, String apiQuote, String localQuote) throws Exception {
        return new JSONObject().put("choice", choice).put("conflict", false)
                .put("reason", "Both transcripts support the additional appointment detail.")
                .put("apiQuote", apiQuote).put("localQuote", localQuote);
    }
    @Test public void meaninglessStructuredOutputCannotBecomeSuccessfulSummary() throws Exception {
        JSONObject generated = new JSONObject().put("title", "통화 안내").put("summary", ": ").put("uncertain", false);
        assertThrows(IOException.class, () -> SummaryDocuments.validateGenerated(generated));
        generated.put("title", "…").put("summary", "회의는 화요일입니다.");
        assertThrows(IOException.class, () -> SummaryDocuments.validateGenerated(generated));
        generated.put("title", "회의 안내").put("uncertain", "false");
        assertThrows(IOException.class, () -> SummaryDocuments.validateGenerated(generated));
    }

    @Test public void conflictingNumbersCannotBeOverriddenByConfidentModel() throws Exception {
        JSONObject api = document("예약은 18일입니다.", "18일 예약");
        JSONObject local = document("예약은 19일입니다.", "19일 예약");
        assertEquals("uncertain", SummaryDocuments.decide(api, local,
                review("local", "18일", "19일")).getString("source"));
    }
    @Test public void unsupportedGeneratedNumbersRequireReviewWithoutApiToo() throws Exception {
        JSONObject local = document("예약 시간을 다시 확인해주세요.", "18일 예약");
        assertEquals("uncertain", SummaryDocuments.decide(SummaryDocuments.empty(), local, null).getString("source"));
    }
    @Test public void supportedLocalImprovementCanBeRecommended() throws Exception {
        JSONObject api = document("예약은 화요일이며 서류를 지참해주세요.", "예약 안내");
        JSONObject local = document("화요일 예약입니다. 서류를 지참해주세요.", "화요일 예약이며 서류 지참이 필요합니다.");
        assertEquals("local", SummaryDocuments.decide(api, local,
                review("local", "서류를 지참해주세요", "서류를 지참해주세요")).getString("source"));
    }
    @Test public void inventedCitationsCannotAuthorizeReplacement() throws Exception {
        JSONObject api = document("예약 확인입니다.", "예약 안내");
        JSONObject local = document("예약 확인입니다.", "예약 안내");
        assertEquals("uncertain", SummaryDocuments.decide(api, local,
                review("local", "결제가 완료됐습니다", "예약 확인")).getString("source"));
    }
    @Test public void punctuationPresentInBothSourcesIsNotSupportingEvidence() throws Exception {
        JSONObject api = document("네, 예약 확인입니다.", "예약 안내");
        JSONObject local = document("네, 예약 확인입니다.", "예약 안내");
        assertEquals("uncertain", SummaryDocuments.decide(api, local,
                review("local", ",", ",")).getString("source"));
    }

    @Test public void semanticConflictAbstainsEvenWithMatchingNumbers() throws Exception {
        JSONObject api = document("예약을 취소했습니다.", "예약 취소");
        JSONObject local = document("예약을 취소하지 않았습니다.", "예약 유지");
        JSONObject verdict = review("local", "예약을 취소", "취소하지 않았습니다").put("conflict", true);
        assertEquals("uncertain", SummaryDocuments.decide(api, local, verdict).getString("source"));
    }
    @Test public void apiTranscriptOnlyRemainsComparableAndOriginalUnmodified() throws Exception {
        JSONObject api = document("배송은 금요일입니다.", "");
        JSONObject local = document("배송은 금요일입니다.", "금요일 배송 예정입니다.");
        String before = api.toString();
        assertEquals("local", SummaryDocuments.decide(api, local,
                review("local", "금요일", "금요일")).getString("source"));
        assertEquals(before, api.toString());
    }
    @Test public void phoneFormattingDoesNotCreateANumericConflict() throws Exception {
        JSONObject api = document("대표번호는 1234-5678입니다.", "1234-5678로 연락");
        JSONObject local = document("대표번호는 1234 5678입니다.", "12345678로 연락");
        assertEquals("local", SummaryDocuments.decide(api, local,
                review("local", "대표번호", "대표번호")).getString("source"));
    }
    @Test public void domesticPhoneLeadingZeroesSurviveSeparatorChanges() throws Exception {
        for (String formatted : new String[]{"010-1234-5678", "02-123-4567"}) {
            String digits = formatted.replace("-", "");
            JSONObject api = document("전화번호는 " + formatted + "입니다.", "전화번호 " + formatted);
            JSONObject local = document("전화번호는 " + digits + "입니다.", "전화번호 " + formatted);
            assertEquals("local", SummaryDocuments.decide(api, local,
                    review("local", "전화번호", "전화번호")).getString("source"));
            assertEquals("local", SummaryDocuments.decide(SummaryDocuments.empty(), local, null).getString("source"));
        }
    }

    @Test public void unknownTimesStayUnknownAndInvalidRangesFail() throws Exception {
        JSONObject input = SummaryDocuments.empty().put("segments", new JSONArray()
                .put(new JSONObject().put("text", "확인했습니다.").put("speaker", "Speaker 2")));
        JSONObject normalized = SummaryDocuments.normalize(input);
        assertTrue(normalized.getJSONArray("segments").getJSONObject(0).isNull("startMs"));
        assertEquals("[Speaker 2] 확인했습니다.", SummaryDocuments.transcript(normalized, true));
        input.getJSONArray("segments").getJSONObject(0).put("startMs", 5).put("endMs", 4);
        assertThrows(IOException.class, () -> SummaryDocuments.normalize(input));
    }
    @Test public void localOnlyDoesNotClaimIndependentConfirmation() throws Exception {
        JSONObject result = SummaryDocuments.decide(SummaryDocuments.empty(), document("배송 안내입니다.", "배송 안내"), null);
        assertEquals("local", result.getString("source"));
        assertFalse(SummaryDocuments.usable(SummaryDocuments.empty().put("title", "통화 제목")));
    }
    @Test public void decimalAndSignChangesCannotBecomeSupportedFacts() throws Exception {
        assertEquals("uncertain", SummaryDocuments.decide(SummaryDocuments.empty(),
                document("요금은 1.5만원입니다.", "요금은 15만원입니다."), null).getString("source"));
        assertEquals("uncertain", SummaryDocuments.decide(SummaryDocuments.empty(),
                document("기온은 -5도입니다.", "기온은 5도입니다."), null).getString("source"));
    }
    @Test public void summaryOnlyApiNumbersAlsoPreventUnsupportedReplacement() throws Exception {
        JSONObject api = SummaryDocuments.empty().put("summary", "18일 예약");
        JSONObject local = document("19일 예약입니다.", "19일 예약");
        assertEquals("uncertain", SummaryDocuments.decide(api, local,
                review("local", "18일", "19일")).getString("source"));
    }
    @Test public void acceptedNormalizedDocumentsRemainRefinable() throws Exception {
        JSONObject result = SummaryDocuments.normalize(document("예약을 확인했습니다.", "예약 확인"));
        JSONObject again = SummaryDocuments.parse(result.toString());
        assertEquals(SummaryDocuments.transcript(result, true), SummaryDocuments.transcript(again, true));
        assertEquals(1250, again.getJSONArray("segments").getJSONObject(0).getLong("startMs"));
        JSONArray many = new JSONArray();
        for (int i = 0; i < 35000; i++) many.put(new JSONObject().put("text", "확인")
                .put("speaker", "Channel 1").put("startMs", i * 1000L).put("endMs", i * 1000L + 500));
        JSONObject oversized = SummaryDocuments.empty().put("segments", many);
        assertThrows(IOException.class, () -> SummaryDocuments.normalize(oversized));
    }
}
