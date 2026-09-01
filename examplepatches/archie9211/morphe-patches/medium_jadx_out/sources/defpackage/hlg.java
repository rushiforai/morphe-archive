package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import androidx.compose.runtime.tooling.DiagnosticComposeException;
import androidx.credentials.exceptions.CreateCredentialCustomException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.internal.FrameworkClassParsingException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hlg {
    public static final d1g g = new d1g(15, "KotlinTypeRefiner", false);
    public static boolean k;
    public static int l;
    public static final /* synthetic */ int m = 0;
    public static final /* synthetic */ int n = 0;
    public static final mz1 a = new mz1(new yz1(22), false, -1596451647);
    public static final mz1 b = new mz1(new j02(11), false, -1029504980);
    public static final mz1 c = new mz1(new u02(8), false, 519992437);
    public static final mz1 d = new mz1(new u02(9), false, 221096492);
    public static final float[] e = {1.0f, 10.0f, 100.0f, 1000.0f, 10000.0f, 100000.0f, 1000000.0f, 1.0E7f, 1.0E8f, 1.0E9f, 1.0E10f};
    public static final long[] f = {-6499023860262858360L, -3512093806901185046L, -9112587656954322510L, -6779048552765515233L, -3862124672529506138L, -215969822234494768L, -7052510166537641086L, -4203951689744663454L, -643253593753441413L, -7319562523736982739L, -4537767136243840520L, -1060522901877412746L, -7580355841314464822L, -4863758783215693124L, -1468012460592228501L, -7835036815511224669L, -5182110000961642932L, -1865951482774665761L, -8083748704375247957L, -5492999862041672042L, -2254563809124702148L, -8326631408344020699L, -5796603242002637969L, -2634068034075909558L, -8563821548938525330L, -6093090917745768758L, -3004677628754823043L, -8795452545612846258L, -6382629663588669919L, -3366601061058449494L, -9021654690802612790L, -6665382345075878084L, -3720041912917459700L, -38366372719436721L, -6941508010590729807L, -4065198994811024355L, -469812725086392539L, -7211161980820077193L, -4402266457597708587L, -891147053569747830L, -7474495936122174250L, -4731433901725329908L, -1302606358729274481L, -7731658001846878407L, -5052886483881210105L, -1704422086424124727L, -7982792831656159810L, -5366805021142811859L, -2096820258001126919L, -8228041688891786181L, -5673366092687344822L, -2480021597431793123L, -8467542526035952558L, -5972742139117552794L, -2854241655469553088L, -8701430062309552536L, -6265101559459552766L, -3219690930897053053L, -8929835859451740015L, -6550608805887287114L, -3576574988931720989L, -9152888395723407474L, -6829424476226871438L, -3925094576856201394L, -294682202642863838L, -7101705404292871755L, -4265445736938701790L, -720121152745989333L, -7367604748107325189L, -4597819916706768583L, -1135588877456072824L, -7627272076051127371L, -4922404076636521310L, -1541319077368263733L, -7880853450996246689L, -5239380795317920458L, -1937539975720012668L, -8128491512466089774L, -5548928372155224313L, -2324474446766642487L, -8370325556870233411L, -5851220927660403859L, -2702340141148116920L, -8606491615858654931L, -6146428501395930760L, -3071349608317525546L, -8837122532839535322L, -6434717147622031249L, -3431710416100151157L, -9062348037703676329L, -6716249028702207507L, -3783625267450371480L, -117845565885576446L, -6991182506319567135L, -4127292114472071014L, -547429124662700864L, -7259672230555269896L, -4462904269766699466L, -966944318780986428L, -7521869226879198374L, -4790650515171610063L, -1376627125537124675L, -7777920981101784778L, -5110715207949843068L, -1776707991509915931L, -8027971522334779313L, -5423278384491086237L, -2167411962186469893L, -8272161504007625539L, -5728515861582144020L, -2548958808550292121L, -8510628282985014432L, -6026599335303880135L, -2921563150702462265L, -8743505996830120772L, -6317696477610263061L, -3285434578585440922L, -8970925639256982432L, -6601971030643840136L, -3640777769877412266L, -9193015133814464522L, -6879582898840692749L, -3987792605123478032L, -373054737976959636L, -7150688238876681629L, -4326674280168464132L, -796656831783192261L, -7415439547505577019L, -4657613415954583370L, -1210330751515841308L, -7673985747338482674L, -4980796165745715438L, -1614309188754756393L, -7926472270612804602L, -5296404319838617848L, -2008819381370884406L, -8173041140997884610L, -5604615407819967859L, -2394083241347571919L, -8413831053483314306L, -5905602798426754978L, -2770317479606055818L, -8648977452394866743L, -6199535797066195524L, -3137733727905356501L, -8878612607581929669L, -6486579741050024183L, -3496538657885142324L, -9102865688819295809L, -6766896092596731857L, -3846934097318526917L, -196981603220770742L, -7040642529654063570L, -4189117143640191558L, -624710411122851544L, -7307973034592864071L, -4523280274813692185L, -1042414325089727327L, -7569037980822161435L, -4849611457600313890L, -1450328303573004458L, -7823984217374209643L, -5168294253290374149L, -1848681798185579782L, -8072955151507069220L, -5479507920956448621L, -2237698882768172872L, -8316090829371189901L, -5783427518286599473L, -2617598379430861437L, -8553528014785370254L, -6080224000054324913L, -2988593981640518238L, -8785400266166405755L, -6370064314280619289L, -3350894374423386208L, -9011838011655698236L, -6653111496142234891L, -3704703351750405709L, -19193171260619233L, -6929524759678968877L, -4050219931171323192L, -451088895536766085L, -7199459587351560659L, -4387638465762062920L, -872862063775190746L, -7463067817500576073L, -4717148753448332187L, -1284749923383027329L, -7720497729755473937L, -5038936143766954517L, -1686984161281305242L, -7971894128441897632L, -5353181642124984136L, -2079791034228842266L, -8217398424034108273L, -5660062011615247437L, -2463391496091671392L, -8457148712698376476L, -5959749872445582691L, -2838001322129590460L, -8691279853972075893L, -6252413799037706963L, -3203831230369745799L, -8919923546622172981L, -6538218414850328322L, -3561087000135522498L, -9143208402725783417L, -6817324484979841368L, -3909969587797413806L, -275775966319379353L, -7089889006590693952L, -4250675239810979535L, -701658031336336515L, -7356065297226292178L, -4583395603105477319L, -1117558485454458744L, -7616003081050118571L, -4908317832885260310L, -1523711272679187483L, -7869848573065574033L, -5225624697904579637L, -1920344853953336643L, -8117744561361917258L, -5535494683275008668L, -2307682335666372931L, -8359830487432564938L, -5838102090863318269L, -2685941595151759932L, -8596242524610931813L, -6133617137336276863L, -3055335403242958174L, -8827113654667930715L, -6422206049907525490L, -3416071543957018958L, -9052573742614218705L, -6704031159840385477L, -3768352931373093942L, -98755145788979524L, -6979250993759194058L, -4112377723771604669L, -528786136287117932L, -7248020362820530564L, -4448339435098275301L, -948738275445456222L, -7510490449794491995L, -4776427043815727089L, -1358847786342270957L, -7766808894105001205L, -5096825099203863602L, -1759345355577441598L, -8017119874876982855L, -5409713825168840664L, -2150456263033662926L, -8261564192037121185L, -5715269221619013577L, -2532400508596379068L, -8500279345513818773L, -6013663163464885563L, -2905392935903719049L, -8733399612580906262L, -6305063497298744923L, -3269643353196043250L, -8961056123388608887L, -6589634135808373205L, -3625356651333078602L, -9183376934724255983L, -6867535149977932074L, -3972732919045027189L, -354230130378896082L, -7138922859127891907L, -4311967555482476980L, -778273425925708321L, -7403949918844649557L, -4643251380128424042L, -1192378206733142148L, -7662765406849295699L, -4966770740134231719L, -1596777406740401745L, -7915514906853832947L, -5282707615139903279L, -1991698500497491195L, -8162340590452013853L, -5591239719637629412L, -2377363631119648861L, -8403381297090862394L, -5892540602936190089L, -2753989735242849707L, -8638772612167862923L, -6186779746782440750L, -3121788665050663033L, -8868646943297746252L, -6474122660694794911L, -3480967307441105734L, -9093133594791772940L, -6754730975062328271L, -3831727700400522434L, -177973607073265139L, -7028762532061872568L, -4174267146649952806L, -606147914885053103L, -7296371474444240046L, -4508778324627912153L, -1024286887357502287L, -7557708332239520786L, -4835449396872013078L, -1432625727662628443L, -7812920107430224633L, -5154464115860392887L, -1831394126398103205L, -8062150356639896359L, -5466001927372482545L, -2220816390788215277L, -8305539271883716405L, -5770238071427257602L, -2601111570856684098L, -8543223759426509417L, -6067343680855748868L, -2972493582642298180L, -8775337516792518219L, -6357485877563259869L, -3335171328526686933L, -9002011107970261189L, -6640827866535438582L, -3689348814741910324L, Long.MIN_VALUE, -6917529027641081856L, -4035225266123964416L, -432345564227567616L, -7187745005283311616L, -4372995238176751616L, -854558029293551616L, -7451627795949551616L, -4702848726509551616L, -1266874889709551616L, -7709325833709551616L, -5024971273709551616L, -1669528073709551616L, -7960984073709551616L, -5339544073709551616L, -2062744073709551616L, -8206744073709551616L, -5646744073709551616L, -2446744073709551616L, -8446744073709551616L, -5946744073709551616L, -2821744073709551616L, -8681119073709551616L, -6239712823709551616L, -3187955011209551616L, -8910000909647051616L, -6525815118631426616L, -3545582879861895366L, -9133518327554766460L, -6805211891016070171L, -3894828845342699810L, -256850038250986858L, -7078060301547948643L, -4235889358507547899L, -683175679707046970L, -7344513827457986212L, -4568956265895094861L, -1099509313941480672L, -7604722348854507276L, -4894216917640746191L, -1506085128623544835L, -7858832233030797378L, -5211854272861108819L, -1903131822648998119L, -8106986416796705681L, -5522047002568494197L, -2290872734783229842L, -8349324486880600507L, -5824969590173362730L, -2669525969289315508L, -8585982758446904049L, -6120792429631242157L, -3039304518611664792L, -8817094351773372351L, -6409681921289327535L, -3400416383184271515L, -9042789267131251553L, -6691800565486676537L, -3753064688430957767L, -79644842111309304L, -6967307053960650171L, -4097447799023424810L, -510123730351893109L, -7236356359111015049L, -4433759430461380907L, -930513269649338230L, -7499099821171918250L, -4762188758037509908L, -1341049929119499481L, -7755685233340769032L, -5082920523248573386L, -1741964635633328828L, -8006256924911912374L, -5396135137712502563L, -2133482903713240300L, -8250955842461857044L, -5702008784649933400L, -2515824962385028846L, -8489919629131724885L, -6000713517987268202L, -2889205879056697349L, -8723282702051517699L, -6292417359137009220L, -3253835680493873621L, -8951176327949752869L, -6577284391509803182L, -3609919470959866074L, -9173728696990998152L, -6855474852811359786L, -3957657547586811828L, -335385916056126881L, -7127145225176161157L, -4297245513042813542L, -759870872876129024L, -7392448323188662496L, -4628874385558440216L, -1174406963520662366L, -7651533379841495835L, -4952730706374481889L, -1579227364540714458L, -7904546130479028392L, -5268996644671397586L, -1974559787411859078L, -8151628894773493780L, -5577850100039479321L, -2360626606621961247L, -8392920656779807636L, -5879464802547371641L, -2737644984756826647L, -8628557143114098510L, -6174010410465235234L, -3105826994654156138L, -8858670899299929442L, -6461652605697523899L, -3465379738694516970L, -9083391364325154962L, -6742553186979055799L, -3816505465296431844L, -158945813193151901L, -7016870160886801794L, -4159401682681114339L, -587566084924005019L, -7284757830718584993L, -4494261269970843337L, -1006140569036166268L, -7546366883288685774L, -4821272585683469313L, -1414904713676948737L, -7801844473689174817L, -5140619573684080617L, -1814088448677712867L, -8051334308064652398L, -5452481866653427593L, -2203916314889396588L, -8294976724446954723L, -5757034887131305500L, -2584607590486743971L, -8532908771695296838L, -6054449946191733143L, -2956376414312278525L, -8765264286586255934L, -6344894339805432014L, -3319431906329402113L, -8992173969096958177L, -6628531442943809817L, -3673978285252374367L, -9213765455923815836L, -6905520801477381891L, -4020214983419339459L, -413582710846786420L, -7176018221920323369L, -4358336758973016307L, -836234930288882479L, -7440175859071633406L, -4688533805412153853L, -1248981238337804412L, -7698142301602209614L, -5010991858575374113L, -1652053804791829737L, -7950062655635975442L, -5325892301117581398L, -2045679357969588844L, -8196078626372074883L, -5633412264537705700L, -2430079312244744221L, -8436328597794046994L, -5933724728815170839L, -2805469892591575644L, -8670947710510816634L, -6226998619711132888L, -3172062256211528206L, -8900067937773286985L, -6513398903789220827L, -3530062611309138130L, -9123818159709293187L, -6793086681209228580L, -3879672333084147821L, -237904397927796872L, -7066219276345954901L, -4221088077005055722L, -664674077828931749L, -7332950326284164199L, -4554501889427817345L, -1081441343357383777L, -7593429867239446717L, -4880101315621920492L, -1488440626100012711L, -7847804418953589800L, -5198069505264599346L, -1885900863153361279L, -8096217067111932656L, -5508585315462527915L, -2274045625900771990L, -8338807543829064350L, -5811823411358942533L, -2653093245771290262L, -8575712306248138270L, -6107954364382784934L, -3023256937051093263L, -8807064613298015146L, -6397144748195131028L, -3384744916816525881L, -9032994600651410532L, -6679557232386875260L, -3737760522056206171L, -60514634142869810L, -6955350673980375487L, -4082502324048081455L, -491441886632713915L, -7224680206786528053L, -4419164240055772162L, -912269281642327298L, -7487697328667536418L, -4747935642407032618L, -1323233534581402868L, -7744549986754458649L, -5069001465015685407L, -1724565812842218855L, -7995382660667468640L, -5382542307406947896L, -2116491865831296966L, -8240336443785642460L, -5688734536304665171L, -2499232151953443560L, -8479549122611984081L, -5987750384837592197L, -2873001962619602342L, -8713155254278333320L, -6279758049420528746L, -3238011543348273028L, -8941286242233752499L, -6564921784364802720L, -3594466212028615495L, -9164070410158966541L, -6843401994271320272L, -3942566474411762436L, -316522074587315140L, -7115355324258153819L, -4282508136895304370L, -741449152691742558L, -7380934748073420955L, -4614482416664388289L, -1156417002403097458L, -7640289654143017767L, -4938676049251384305L, -1561659043136842477L, -7893565929601608404L, -5255271393574622601L, -1957403223540890347L, -8140906042354138323L, -5564446534515285000L, -2343872149716718346L, -8382449121214030822L, -5866375383090150624L, -2721283210435300376L, -8618331034163144591L, -6161227774276542835L, -3089848699418290639L, -8848684464777513506L, -6449169562544503978L, -3449775934753242068L, -9073638986861858149L, -6730362715149934782L, -3801267375510030573L, -139898200960150313L, -7004965403241175802L, -4144520735624081848L, -568964901102714406L, -7273132090830278360L, -4479729095110460046L, -987975350460687153L, -7535013621679011327L, -4807081008671376254L, -1397165242411832414L, -7790757304148477115L, -5126760611758208489L, -1796764746270372707L, -8040506994060064798L, -5438947724147693094L, -2186998636757228463L, -8284403175614349646L, -5743817951090549153L, -2568086420435798537L, -8522583040413455942L, -6041542782089432023L, -2940242459184402125L, -8755180564631333184L, -6332289687361778576L, -3303676090774835316L, -8982326584375353929L, -6616222212041804507L, -3658591746624867729L, -9204148869281624187L, -6893500068174642330L, -4005189066790915008L, -394800315061255856L, -7164279224554366766L, -4343663012265570553L, -817892746904575288L, -7428711994456441411L, -4674203974643163860L, -1231068949876566920L, -7686947121313936181L, -4996997883215032323L, -1634561335591402499L, -7939129862385708418L, -5312226309554747619L, -2028596868516046619L, -8185402070463610993L};
    public static final StackTraceElement[] h = new StackTraceElement[0];
    public static final lr i = new lr(PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
    public static final Object j = new Object();

    public static final void A(do4 do4Var) throws Throwable {
        if (do4Var instanceof pld) {
            throw ((pld) do4Var).a;
        }
    }

    public static int B(Context context, int i2, int i3) {
        Integer numValueOf;
        TypedValue typedValueU = sgg.U(context.getTheme(), i2);
        if (typedValueU != null) {
            int i4 = typedValueU.resourceId;
            numValueOf = Integer.valueOf(i4 != 0 ? context.getColor(i4) : typedValueU.data);
        } else {
            numValueOf = null;
        }
        return numValueOf != null ? numValueOf.intValue() : i3;
    }

    public static int C(View view, int i2) {
        Context context = view.getContext();
        Context context2 = view.getContext();
        String canonicalName = view.getClass().getCanonicalName();
        TypedValue typedValueU = sgg.U(context2.getTheme(), i2);
        if (typedValueU != null) {
            int i3 = typedValueU.resourceId;
            return i3 != 0 ? context.getColor(i3) : typedValueU.data;
        }
        fm3.e("%1$s requires a value for the %2$s attribute to be set in your app theme. You can either set the attribute in your theme or update your theme to inherit from Theme.MaterialComponents (or a descendant).", new Object[]{canonicalName, context2.getResources().getResourceName(i2)});
        return 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object D(defpackage.pld r4, defpackage.c55 r5, java.lang.Throwable r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.po4
            if (r0 == 0) goto L13
            r0 = r7
            po4 r0 = (defpackage.po4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            po4 r0 = new po4
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            java.lang.Throwable r6 = r0.b
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L29
            goto L40
        L29:
            r4 = move-exception
            goto L43
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            r0.b = r6     // Catch: java.lang.Throwable -> L29
            r0.d = r3     // Catch: java.lang.Throwable -> L29
            java.lang.Object r4 = r5.f(r4, r6, r0)     // Catch: java.lang.Throwable -> L29
            if (r4 != r1) goto L40
            return r1
        L40:
            c1e r4 = defpackage.c1e.a
            return r4
        L43:
            if (r6 == 0) goto L4a
            if (r6 == r4) goto L4a
            defpackage.kyd.D(r4, r6)
        L4a:
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.D(pld, c55, java.lang.Throwable, p92):java.lang.Object");
    }

    public static boolean E(int i2) {
        if (i2 == 0) {
            return false;
        }
        ThreadLocal threadLocal = rv1.a;
        double[] dArr = (double[]) threadLocal.get();
        if (dArr == null) {
            dArr = new double[3];
            threadLocal.set(dArr);
        }
        int iRed = Color.red(i2);
        int iGreen = Color.green(i2);
        int iBlue = Color.blue(i2);
        if (dArr.length != 3) {
            ay0.e("outXyz must have a length of 3.");
            return false;
        }
        double d2 = ((double) iRed) / 255.0d;
        double dPow = d2 < 0.04045d ? d2 / 12.92d : Math.pow((d2 + 0.055d) / 1.055d, 2.4d);
        double d3 = ((double) iGreen) / 255.0d;
        double dPow2 = d3 < 0.04045d ? d3 / 12.92d : Math.pow((d3 + 0.055d) / 1.055d, 2.4d);
        double d4 = ((double) iBlue) / 255.0d;
        double dPow3 = d4 < 0.04045d ? d4 / 12.92d : Math.pow((d4 + 0.055d) / 1.055d, 2.4d);
        dArr[0] = ((0.1805d * dPow3) + (0.3576d * dPow2) + (0.4124d * dPow)) * 100.0d;
        double d5 = ((0.0722d * dPow3) + (0.7152d * dPow2) + (0.2126d * dPow)) * 100.0d;
        dArr[1] = d5;
        dArr[2] = ((dPow3 * 0.9505d) + (dPow2 * 0.1192d) + (dPow * 0.0193d)) * 100.0d;
        return d5 / 100.0d > 0.5d;
    }

    public static final boolean F(KeyEvent keyEvent) {
        long jP0 = nk7.p0(keyEvent);
        int i2 = fk6.O;
        return fk6.a(jP0, fk6.h) || fk6.a(jP0, fk6.r) || fk6.a(jP0, fk6.E) || fk6.a(jP0, fk6.q);
    }

    public static int G(float f2, int i2, int i3) {
        return rv1.b(rv1.d(i3, Math.round(Color.alpha(i3) * f2)), i2);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0107 A[EDGE_INSN: B:37:0x0107->B:99:0x0274 BREAK  A[LOOP:1: B:93:0x0254->B:183:?]] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0204  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object H(defpackage.mn6 r12, defpackage.rwd r13, defpackage.c55 r14) {
        /*
            Method dump skipped, instruction units count: 1008
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.H(mn6, rwd, c55):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:48:0x0105, code lost:
    
        if (defpackage.f93.g(r1).equals(defpackage.f93.g(r2)) == false) goto L51;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.mg6 I(defpackage.s55 r6, defpackage.lqe r7) {
        /*
            Method dump skipped, instruction units count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.I(s55, lqe):mg6");
    }

    /* JADX WARN: Removed duplicated region for block: B:134:0x0210  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long K(int r32, int r33, java.lang.String r34) {
        /*
            Method dump skipped, instruction units count: 798
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.K(int, int, java.lang.String):long");
    }

    public static final long L(String str) {
        mn3 mn3Var;
        char cCharAt;
        int length = str.length();
        if (length == 0) {
            ay0.e("The string is empty");
            return 0L;
        }
        int i2 = in3.d;
        char cCharAt2 = str.charAt(0);
        int i3 = (cCharAt2 == '+' || cCharAt2 == '-') ? 1 : 0;
        boolean z = i3 > 0 && muc.q0(str, '-');
        if (length <= i3) {
            ay0.e("No components");
            return 0L;
        }
        if (str.charAt(i3) != 'P') {
            lg8.r();
            return 0L;
        }
        int i4 = i3 + 1;
        if (i4 == length) {
            lg8.r();
            return 0L;
        }
        mn3 mn3Var2 = null;
        long jH = 0;
        boolean z2 = false;
        while (i4 < length) {
            if (str.charAt(i4) != 'T') {
                int i5 = i4;
                while (i5 < str.length() && (('0' <= (cCharAt = str.charAt(i5)) && cCharAt < ':') || muc.R("+-.", cCharAt))) {
                    i5++;
                }
                String strSubstring = str.substring(i4, i5);
                if (strSubstring.length() == 0) {
                    lg8.r();
                    return 0L;
                }
                int length2 = strSubstring.length() + i4;
                if (length2 < 0 || length2 >= str.length()) {
                    ay0.e("Missing unit for value ".concat(strSubstring));
                    return 0L;
                }
                char cCharAt3 = str.charAt(length2);
                int i6 = length2 + 1;
                if (z2) {
                    if (cCharAt3 == 'H') {
                        mn3Var = mn3.HOURS;
                    } else if (cCharAt3 == 'M') {
                        mn3Var = mn3.MINUTES;
                    } else {
                        if (cCharAt3 != 'S') {
                            throw new IllegalArgumentException("Invalid duration ISO time unit: " + cCharAt3);
                        }
                        mn3Var = mn3.SECONDS;
                    }
                } else {
                    if (cCharAt3 != 'D') {
                        throw new IllegalArgumentException("Invalid or unsupported duration ISO non-time unit: " + cCharAt3);
                    }
                    mn3Var = mn3.DAYS;
                }
                if (mn3Var2 != null && mn3Var2.compareTo(mn3Var) <= 0) {
                    ay0.e("Unexpected order of duration components");
                    return 0L;
                }
                int iY = muc.Y(strSubstring, '.', 0, 6);
                jH = (mn3Var != mn3.SECONDS || iY <= 0) ? in3.h(jH, U(M(strSubstring), mn3Var)) : in3.h(in3.h(jH, U(M(strSubstring.substring(0, iY)), mn3Var)), S(Double.parseDouble(strSubstring.substring(iY)), mn3Var));
                mn3Var2 = mn3Var;
                i4 = i6;
            } else {
                if (z2 || (i4 = i4 + 1) == length) {
                    lg8.r();
                    return 0L;
                }
                z2 = true;
            }
        }
        return z ? in3.l(jH) : jH;
    }

    public static final long M(String str) {
        char cCharAt;
        int length = str.length();
        int i2 = (length <= 0 || !muc.R("+-", str.charAt(0))) ? 0 : 1;
        if (length - i2 > 16) {
            int i3 = i2;
            while (true) {
                if (i2 < length) {
                    char cCharAt2 = str.charAt(i2);
                    if (cCharAt2 == '0') {
                        if (i3 == i2) {
                            i3++;
                        }
                    } else if ('1' > cCharAt2 || cCharAt2 >= ':') {
                        break;
                    }
                    i2++;
                } else if (length - i3 > 16) {
                    return str.charAt(0) == '-' ? Long.MIN_VALUE : Long.MAX_VALUE;
                }
            }
        }
        return (!tuc.N(str, "+", false) || length <= 1 || '0' > (cCharAt = str.charAt(1)) || cCharAt >= ':') ? Long.parseLong(str) : Long.parseLong(muc.T(1, str));
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0091  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.mn6 N(defpackage.mn6 r7, java.util.ArrayList r8) {
        /*
            java.util.List r0 = r7.h0()
            r0.size()
            r8.size()
            java.util.ArrayList r0 = new java.util.ArrayList
            r1 = 10
            int r1 = defpackage.cu1.k0(r8, r1)
            r0.<init>(r1)
            java.util.Iterator r8 = r8.iterator()
        L19:
            boolean r1 = r8.hasNext()
            r2 = 0
            if (r1 == 0) goto L9b
            java.lang.Object r1 = r8.next()
            svd r1 = (defpackage.svd) r1
            r1.getClass()
            mn6 r3 = r1.c
            mn6 r4 = r1.b
            swd r1 = r1.a
            df8 r5 = defpackage.on6.a
            r5.b(r4, r3)
            boolean r5 = defpackage.g76.L(r4, r3)
            if (r5 != 0) goto L91
            pqe r5 = r1.z()
            pqe r6 = defpackage.pqe.IN_VARIANCE
            if (r5 != r6) goto L43
            goto L91
        L43:
            boolean r5 = defpackage.vm6.E(r4)
            if (r5 == 0) goto L5f
            pqe r5 = r1.z()
            if (r5 == r6) goto L5f
            onc r2 = new onc
            pqe r4 = defpackage.pqe.OUT_VARIANCE
            pqe r1 = r1.z()
            if (r4 != r1) goto L5b
            pqe r4 = defpackage.pqe.INVARIANT
        L5b:
            r2.<init>(r3, r4)
            goto L96
        L5f:
            if (r3 == 0) goto L8b
            boolean r2 = defpackage.vm6.x(r3)
            if (r2 == 0) goto L7b
            boolean r2 = r3.k0()
            if (r2 == 0) goto L7b
            onc r2 = new onc
            pqe r1 = r1.z()
            if (r6 != r1) goto L77
            pqe r6 = defpackage.pqe.INVARIANT
        L77:
            r2.<init>(r4, r6)
            goto L96
        L7b:
            onc r2 = new onc
            pqe r4 = defpackage.pqe.OUT_VARIANCE
            pqe r1 = r1.z()
            if (r4 != r1) goto L87
            pqe r4 = defpackage.pqe.INVARIANT
        L87:
            r2.<init>(r3, r4)
            goto L96
        L8b:
            r7 = 140(0x8c, float:1.96E-43)
            defpackage.vm6.a(r7)
            throw r2
        L91:
            onc r2 = new onc
            r2.<init>(r4)
        L96:
            r0.add(r2)
            goto L19
        L9b:
            r8 = 6
            mn6 r7 = defpackage.lk7.C(r7, r0, r2, r8)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.N(mn6, java.util.ArrayList):mn6");
    }

    public static final g90 O(long j2, p65 p65Var) {
        sn3 sn3Var = eo.b;
        nx5 nx5Var = new nx5((Context) p65Var.j(sn3Var));
        nx5Var.c = new ColorDrawable(op8.n0(j2));
        float fZ = ((m73) p65Var.j(z22.h)).Z(2.0f);
        ord[] ordVarArr = {new gmb(fZ, fZ, fZ, fZ)};
        q84 q84Var = tx5.a;
        tx5.b(nx5Var, k80.Q0(ordVarArr));
        return dm2.S(nx5Var.a(), yec.a((Context) p65Var.j(sn3Var)), p65Var);
    }

    public static final r28 P(r28 r28Var, boolean z, m68 m68Var, w06 w06Var, boolean z2, vkb vkbVar, m45 m45Var) {
        r28 r28VarB;
        if (w06Var != null) {
            r28VarB = new swb(z, m68Var, w06Var, false, z2, vkbVar, m45Var);
        } else if (w06Var == null) {
            r28VarB = new swb(z, m68Var, null, false, z2, vkbVar, m45Var);
        } else {
            o28 o28Var = o28.b;
            r28VarB = m68Var != null ? s06.a(o28Var, m68Var, w06Var).b(new swb(z, m68Var, null, false, z2, vkbVar, m45Var)) : gx1.E(o28Var, new twb(w06Var, z, z2, vkbVar, m45Var));
        }
        return r28Var.b(r28VarB);
    }

    public static r28 Q(r28 r28Var, boolean z, vkb vkbVar, m45 m45Var) {
        return r28Var.b(new swb(z, null, null, true, true, vkbVar, m45Var));
    }

    public static final y05 R(y05 y05Var, y05 y05Var2) {
        y05Var.getClass();
        z05 z05Var = y05Var.a;
        y05Var2.getClass();
        z05 z05Var2 = y05Var2.a;
        if (!y05Var.equals(y05Var2) && !z05Var2.c()) {
            String str = z05Var.a;
            String str2 = z05Var2.a;
            if (!tuc.N(str, str2, false) || str.charAt(str2.length()) != '.') {
                return y05Var;
            }
        }
        return z05Var2.c() ? y05Var : y05Var.equals(y05Var2) ? y05.c : new y05(z05Var.a.substring(z05Var2.a.length() + 1));
    }

    public static final long S(double d2, mn3 mn3Var) {
        mn3Var.getClass();
        double dK = kng.k(d2, mn3Var, mn3.NANOSECONDS);
        if (Double.isNaN(dK)) {
            ay0.e("Duration value cannot be NaN.");
            return 0L;
        }
        long jX0 = nk7.x0(dK);
        return (-4611686018426999999L > jX0 || jX0 >= 4611686018427000000L) ? y(nk7.x0(kng.k(d2, mn3Var, mn3.MILLISECONDS))) : z(jX0);
    }

    public static final long T(int i2, mn3 mn3Var) {
        mn3Var.getClass();
        if (mn3Var.compareTo(mn3.SECONDS) > 0) {
            return U(i2, mn3Var);
        }
        long j2 = i2;
        mn3 mn3Var2 = mn3.NANOSECONDS;
        mn3Var2.getClass();
        return z(mn3Var2.getTimeUnit$kotlin_stdlib().convert(j2, mn3Var.getTimeUnit$kotlin_stdlib()));
    }

    public static final long U(long j2, mn3 mn3Var) {
        mn3Var.getClass();
        mn3 mn3Var2 = mn3.NANOSECONDS;
        mn3Var2.getClass();
        long jConvert = mn3Var.getTimeUnit$kotlin_stdlib().convert(4611686018426999999L, mn3Var2.getTimeUnit$kotlin_stdlib());
        if ((-jConvert) <= j2 && j2 <= jConvert) {
            return z(mn3Var2.getTimeUnit$kotlin_stdlib().convert(j2, mn3Var.getTimeUnit$kotlin_stdlib()));
        }
        mn3 mn3Var3 = mn3.MILLISECONDS;
        mn3Var3.getClass();
        return x(iq7.w(mn3Var3.getTimeUnit$kotlin_stdlib().convert(j2, mn3Var.getTimeUnit$kotlin_stdlib()), -4611686018427387903L, 4611686018427387903L));
    }

    public static final boolean V(Throwable th, m45 m45Var) {
        DiagnosticComposeException diagnosticComposeException;
        List listX = kyd.X(th);
        int size = listX.size();
        boolean z = false;
        for (int i2 = 0; i2 < size; i2++) {
            if (((Throwable) listX.get(i2)) instanceof DiagnosticComposeException) {
                return false;
            }
        }
        try {
            n12 n12Var = (n12) m45Var.invoke();
            if (n12Var != null) {
                boolean z2 = n12Var.b;
                List list = n12Var.a;
                if (z2) {
                    int size2 = list.size();
                    for (int i3 = 0; i3 < size2; i3++) {
                        ((p12) list.get(i3)).getClass();
                    }
                } else if (!list.isEmpty()) {
                    z = true;
                }
            }
            if (z) {
                n12Var.getClass();
                diagnosticComposeException = new DiagnosticComposeException(n12Var);
            } else {
                diagnosticComposeException = null;
            }
        } catch (Throwable th2) {
            diagnosticComposeException = th2;
        }
        if (diagnosticComposeException != null) {
            kyd.D(th, diagnosticComposeException);
        }
        return z;
    }

    public static final void W(nx5 nx5Var) {
        nx5Var.r = dqb.FILL;
        q84 q84Var = wx5.a;
        nx5Var.n = new vx5(1);
        int i2 = 0;
        nx5Var.o = new vx5(i2);
        nx5Var.p = new ux5(R.drawable.avatar_fallback, i2);
        ord[] ordVarArr = {new am1()};
        q84 q84Var2 = tx5.a;
        tx5.b(nx5Var, k80.Q0(ordVarArr));
    }

    public static final void X(nx5 nx5Var, Context context) {
        context.getClass();
        nx5Var.r = dqb.FILL;
        q84 q84Var = wx5.a;
        nx5Var.n = new vx5(1);
        int i2 = 0;
        nx5Var.o = new vx5(i2);
        nx5Var.p = new ux5(R.drawable.avatar_placeholder, i2);
        Z(nx5Var, context);
    }

    public static void Y(nx5 nx5Var, Context context) {
        context.getClass();
        GradientDrawable gradientDrawable = new GradientDrawable();
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(R.attr.backgroundNeutralSecondary, typedValue, true);
        gradientDrawable.setColor(typedValue.data);
        q84 q84Var = wx5.a;
        nx5Var.n = new ff4(13, dm2.y(gradientDrawable));
    }

    public static final void Z(nx5 nx5Var, Context context) {
        context.getClass();
        float dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.common_rounded_corner_radius_small);
        ord[] ordVarArr = {new gmb(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize, dimensionPixelSize)};
        q84 q84Var = tx5.a;
        tx5.b(nx5Var, k80.Q0(ordVarArr));
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x020a  */
    /* JADX WARN: Removed duplicated region for block: B:141:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0127  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final defpackage.m45 r24, final defpackage.mz1 r25, defpackage.r28 r26, defpackage.b55 r27, defpackage.b55 r28, defpackage.b55 r29, final defpackage.b55 r30, defpackage.m3c r31, long r32, long r34, long r36, long r38, defpackage.pb3 r40, defpackage.x12 r41, final int r42, final int r43, final int r44) {
        /*
            Method dump skipped, instruction units count: 547
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.a(m45, mz1, r28, b55, b55, b55, b55, m3c, long, long, long, long, pb3, x12, int, int, int):void");
    }

    public static final void b(jt0 jt0Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        jt0Var.getClass();
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-641212476);
        int i3 = i2 | (p65Var.f(jt0Var) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | 384;
        int i4 = 1;
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = bjc.b(new bt0(jt0Var, i5));
                p65Var.j0(objM);
            }
            upc upcVar = (upc) objM;
            c09 c09VarJ = vn7.J(R.drawable.ic_book_placeholder, 0, p65Var);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(bgf.N(o28Var, "book_item"), 1.0f);
            boolean zBooleanValue = ((Boolean) upcVar.getValue()).booleanValue();
            boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new ct0(x45Var, jt0Var, i5);
                p65Var.j0(objM2);
            }
            r28 r28VarA0 = flb.a0(r(r28VarD, zBooleanValue, null, null, (m45) objM2, 14), ((zo7) p65Var.j(kt7.b)).a, rv8.r);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM5);
            }
            l78 l78Var2 = (l78) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM6;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM7;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM8 = p65Var.M();
            if (zH || objM8 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 1);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM8;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM9 = p65Var.M();
            if (objM9 == uobVar) {
                objM9 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM9);
            }
            m45 m45Var = (m45) objM9;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM10 = p65Var.M();
            if (zH2 || objM10 == uobVar) {
                objM10 = new hr0(hl7Var, i4);
                p65Var.j0(objM10);
            }
            j(wxb.a(r28VarA0, false, (x45) objM10), pxf.E(1200550679, new dt0(l78Var3, z52Var, m45Var, jt0Var, c09VarJ, upcVar, 0), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 3, jt0Var, x45Var, r28Var2);
        }
    }

    public static final void c(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1177129915);
        int i3 = i2 | 6;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarA0 = flb.a0(jfc.d(bgf.N(r28Var3, "book_item"), 1.0f), ((zo7) p65Var.j(kt7.b)).a, rv8.r);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var2 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0 fr0Var = new fr0(l78Var2, hl7Var, m62Var, l78Var, 2);
                p65Var.j0(fr0Var);
                objM6 = fr0Var;
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            int i4 = 2;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            j(wxb.a(r28VarA0, false, (x45) objM8), pxf.E(1200550679, new ht0(l78Var2, z52Var, m45Var, j2, 0), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j2, i2, 3);
        }
    }

    public static final void d(x64 x64Var, kv6 kv6Var, l64 l64Var, sh9 sh9Var, obe obeVar, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1775169762);
        int i3 = i2 | (p65Var.f(x64Var) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(l64Var) ? 256 : 128) | (p65Var.f(sh9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(obeVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(cs1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288);
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            int i4 = i3 & 896;
            boolean z = ((i3 & 14) == 4) | (i4 == 256);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new rc0(x64Var, l64Var, null, 13);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, x64Var);
            boolean z2 = (x64Var instanceof u64) && ((u64) x64Var).g;
            boolean z3 = i4 == 256;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new hq3(0, l64Var, l64.class, "onRefresh", "onRefresh()V", 0, 16);
                p65Var.j0(objM2);
            }
            int i5 = (i3 >> 12) & 896;
            er7.d(z2, (m45) ((qh6) objM2), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1814135728, new h64(kv6Var, x64Var, l64Var, sh9Var, obeVar, cs1Var), p65Var), p65Var, i5, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(x64Var, kv6Var, l64Var, sh9Var, obeVar, cs1Var, r28Var, i2, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:70:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:86:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(defpackage.x64 r26, defpackage.nhc r27, defpackage.kv6 r28, defpackage.l64 r29, defpackage.sh9 r30, defpackage.obe r31, defpackage.cs1 r32, defpackage.r28 r33, defpackage.x12 r34, int r35, int r36) {
        /*
            Method dump skipped, instruction units count: 350
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.e(x64, nhc, kv6, l64, sh9, obe, cs1, r28, x12, int, int):void");
    }

    public static final void f(String str, bo4 bo4Var, b64 b64Var, r28 r28Var, f74 f74Var, x12 x12Var, int i2) {
        f74 f74Var2;
        int i3;
        f74 f74Var3;
        f74 f74Var4;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1658598070);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(b64Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        int i5 = 1;
        boolean z = false;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z2 = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new mb(str, 17);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    f74 f74Var5 = (f74) to7.z(n1b.a.b(f74.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-57345);
                    f74Var3 = f74Var5;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                f74Var3 = f74Var;
            }
            p65Var.q();
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            l78 l78VarZ = guc.z(f74Var3.t, p65Var, 0);
            l64 l64Var = new l64(f74Var3, b64Var);
            md3 md3Var = new md3(b64Var, i5, f74Var3);
            s26 s26Var = new s26(b64Var, 22, f74Var3);
            lig ligVar = new lig(b64Var, f74Var3, z, 26);
            e((x64) l78VarZ.getValue(), nhcVarF, kv6VarA, l64Var, md3Var, ligVar, s26Var, r28Var, p65Var, (i3 << 12) & 29360128, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH = p65Var.h(f74Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(md3Var) | p65Var.f(s26Var) | p65Var.f(ligVar);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                f74Var4 = f74Var3;
                objM3 = new nz(f74Var4, nhcVarF, sb2Var, resources, md3Var, s26Var, ligVar, null, 5);
                p65Var.j0(objM3);
            } else {
                f74Var4 = f74Var3;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new wi1(bo4Var, kv6VarA, null, 3);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            f74Var2 = f74Var4;
        } else {
            p65Var.S();
            f74Var2 = f74Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, bo4Var, b64Var, r28Var, f74Var2, i2, 17);
        }
    }

    public static final void g(jt0 jt0Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        l78 l78Var;
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1498649034);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(jt0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = bjc.b(new bt0(jt0Var, i4));
                p65Var.j0(objM);
            }
            upc upcVar = (upc) objM;
            c09 c09VarJ = vn7.J(R.drawable.ic_book_placeholder, 0, p65Var);
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            boolean zBooleanValue = ((Boolean) upcVar.getValue()).booleanValue();
            boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new ct0(x45Var, jt0Var, i4);
                p65Var.j0(objM2);
            }
            r28 r28VarR = r(r28VarD, zBooleanValue, null, null, (m45) objM2, 14);
            sn3 sn3Var = kt7.b;
            r28 r28VarN = bgf.N(bo.B(flb.a0(r28VarR, ((zo7) p65Var.j(sn3Var)).c, rv8.r), 1.0f, ((zo7) p65Var.j(sn3Var)).z, bmb.a(4.0f)), "featured_book_item");
            p65Var.Y(-1003410150);
            p65Var.Y(212064437);
            p65Var.p(false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM5);
            }
            l78 l78Var2 = (l78) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM6;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM7;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM8 = p65Var.M();
            if (zH || objM8 == uobVar) {
                fr0 fr0Var = new fr0(l78Var3, hl7Var, m62Var, l78Var2, 3);
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
                objM8 = fr0Var;
            } else {
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) objM8;
            Object objM9 = p65Var.M();
            int i5 = 3;
            if (objM9 == uobVar) {
                objM9 = new gr0(l78Var, m62Var, i5);
                p65Var.j0(objM9);
            }
            m45 m45Var = (m45) objM9;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM10 = p65Var.M();
            if (zH2 || objM10 == uobVar) {
                objM10 = new hr0(hl7Var, i5);
                p65Var.j0(objM10);
            }
            j(wxb.a(r28VarN, false, (x45) objM10), pxf.E(1200550679, new dt0(l78Var3, z52Var, m45Var, jt0Var, c09VarJ, upcVar, 1), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 7, jt0Var, x45Var, r28Var);
        }
    }

    public static final void h(int i2, long j2, x12 x12Var, r28 r28Var) {
        int i3;
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(968143917);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(r28Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            r28 r28VarN = bgf.N(bo.B(jfc.d(r28Var, 1.0f), 1.0f, ((zo7) p65Var.j(kt7.b)).z, bmb.a(4.0f)), "featured_book_item_skeleton");
            p65Var.Y(-1003410150);
            p65Var.Y(212064437);
            p65Var.p(false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 4);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM6;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            j(wxb.a(r28VarN, false, (x45) objM8), pxf.E(1200550679, new ht0(l78Var3, z52Var, m45Var, j2, 1), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var, j2, i2, 4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01cf  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:66:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void i(java.lang.String r51, java.lang.String r52, defpackage.r28 r53, boolean r54, defpackage.x12 r55, int r56, int r57) {
        /*
            Method dump skipped, instruction units count: 491
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hlg.i(java.lang.String, java.lang.String, r28, boolean, x12, int, int):void");
    }

    public static final void j(r28 r28Var, mz1 mz1Var, zk7 zk7Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1663319424);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2 | (p65Var.f(zk7Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            int iS = w2g.s(p65Var);
            r28 r28VarR = gx1.R(p65Var, r28Var);
            i89 i89VarL = p65Var.l();
            ot2 ot2Var = ot2.C;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            r12.W.getClass();
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            if (p65Var.S) {
                p65Var.b(new n2c(14), c1e.a);
            }
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            tp7.B(p65Var, q12.g, Integer.valueOf(iS));
            km4.H(6, mz1Var, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y22(r28Var, mz1Var, zk7Var, i2);
        }
    }

    public static final z60 k(mn6 mn6Var) {
        pqe pqeVarB;
        svd svdVar;
        mn6Var.getClass();
        if (mn6Var.m0() instanceof zm4) {
            z60 z60VarK = k(f49.N(mn6Var));
            z60 z60VarK2 = k(f49.X(mn6Var));
            return new z60(qk7.t(pwd.K(f49.N((mn6) z60VarK.a), f49.X((mn6) z60VarK2.a)), mn6Var), qk7.t(pwd.K(f49.N((mn6) z60VarK.b), f49.X((mn6) z60VarK2.b)), mn6Var));
        }
        zvd zvdVarJ0 = mn6Var.j0();
        if (mn6Var.j0() instanceof m61) {
            zvdVarJ0.getClass();
            xwd xwdVarD = ((m61) zvdVarJ0).d();
            mn6 mn6VarB = xwdVarD.b();
            mn6VarB.getClass();
            mn6 mn6VarI = nxd.i(mn6VarB, mn6Var.k0());
            mn6VarI.getClass();
            int i2 = k61.a[xwdVarD.a().ordinal()];
            if (i2 == 2) {
                return new z60(mn6VarI, ok7.B(mn6Var).o());
            }
            if (i2 != 3) {
                rd6.u("Only nontrivial projections should have been captured, not: ", xwdVarD);
                return null;
            }
            mn6 mn6VarI2 = nxd.i(ok7.B(mn6Var).n(), mn6Var.k0());
            mn6VarI2.getClass();
            return new z60(mn6VarI2, mn6VarI);
        }
        if (mn6Var.h0().isEmpty() || mn6Var.h0().size() != zvdVarJ0.getParameters().size()) {
            return new z60(mn6Var, mn6Var);
        }
        ArrayList<svd> arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        List listH0 = mn6Var.h0();
        List parameters = zvdVarJ0.getParameters();
        parameters.getClass();
        Iterator it2 = bu1.t1(parameters, listH0).iterator();
        while (true) {
            boolean z = true;
            if (!it2.hasNext()) {
                if (arrayList.isEmpty()) {
                    z = false;
                } else {
                    for (svd svdVar2 : arrayList) {
                        svdVar2.getClass();
                        if (!on6.a.b(svdVar2.b, svdVar2.c)) {
                            break;
                        }
                    }
                    z = false;
                }
                return new z60(z ? ok7.B(mn6Var).n() : N(mn6Var, arrayList), N(mn6Var, arrayList2));
            }
            f09 f09Var = (f09) it2.next();
            xwd xwdVar = (xwd) f09Var.a;
            swd swdVar = (swd) f09Var.b;
            swdVar.getClass();
            pqe pqeVarZ = swdVar.z();
            if (pqeVarZ == null) {
                ixd.a(35);
                throw null;
            }
            if (xwdVar == null) {
                ixd.a(36);
                throw null;
            }
            ixd ixdVar = ixd.b;
            if (xwdVar.c()) {
                pqeVarB = pqe.OUT_VARIANCE;
                if (pqeVarB == null) {
                    ixd.a(37);
                    throw null;
                }
            } else {
                pqeVarB = ixd.b(pqeVarZ, xwdVar.a());
            }
            int i3 = k61.a[pqeVarB.ordinal()];
            if (i3 == 1) {
                mn6 mn6VarB2 = xwdVar.b();
                mn6VarB2.getClass();
                mn6 mn6VarB3 = xwdVar.b();
                mn6VarB3.getClass();
                svdVar = new svd(swdVar, mn6VarB2, mn6VarB3);
            } else if (i3 == 2) {
                mn6 mn6VarB4 = xwdVar.b();
                mn6VarB4.getClass();
                svdVar = new svd(swdVar, mn6VarB4, f93.e(swdVar).o());
            } else {
                if (i3 != 3) {
                    ygf.a();
                    return null;
                }
                hec hecVarN = f93.e(swdVar).n();
                mn6 mn6VarB5 = xwdVar.b();
                mn6VarB5.getClass();
                svdVar = new svd(swdVar, hecVarN, mn6VarB5);
            }
            if (xwdVar.c()) {
                arrayList.add(svdVar);
                arrayList2.add(svdVar);
            } else {
                z60 z60VarK3 = k(svdVar.b);
                mn6 mn6Var2 = (mn6) z60VarK3.a;
                mn6 mn6Var3 = (mn6) z60VarK3.b;
                z60 z60VarK4 = k(svdVar.c);
                mn6 mn6Var4 = (mn6) z60VarK4.a;
                mn6 mn6Var5 = (mn6) z60VarK4.b;
                swd swdVar2 = svdVar.a;
                svd svdVar3 = new svd(swdVar2, mn6Var3, mn6Var4);
                svd svdVar4 = new svd(swdVar2, mn6Var2, mn6Var5);
                arrayList.add(svdVar3);
                arrayList2.add(svdVar4);
            }
        }
    }

    public static final String l(jt0 jt0Var, p65 p65Var) {
        p65Var.Y(1743162580);
        StringBuilder sb = new StringBuilder();
        List list = jt0Var.c;
        Long l2 = jt0Var.f;
        sb.append((String) bu1.x0(list));
        if (jt0Var.c.size() > 1) {
            p65Var.Y(-76523594);
            sb.append(vo7.R(p65Var, R.string.et_al));
        } else {
            p65Var.Y(-84137132);
        }
        p65Var.p(false);
        String string = sb.toString();
        p65Var.p(false);
        if (l2 == null) {
            p65Var.Y(-1796106849);
            p65Var.p(false);
            return string;
        }
        p65Var.Y(-1796316316);
        String str = new SimpleDateFormat("yyyy", Locale.US).format(l2);
        str.getClass();
        String strQ = vo7.Q(R.string.publication_and_author, new Object[]{str, string}, p65Var);
        p65Var.p(false);
        return strQ;
    }

    public static final void m(int i2, int i3) {
        if (i2 < 0 || i2 >= i3) {
            z10.i(ev6.v("index: ", i2, i3, ", size: "));
        }
    }

    public static final void n(int i2, int i3) {
        if (i2 < 0 || i2 > i3) {
            z10.i(ev6.v("index: ", i2, i3, ", size: "));
        }
    }

    public static final void o(int i2, int i3, int i4) {
        if (i2 < 0 || i3 > i4) {
            ik4.e(i4, ev6.B(i2, i3, "fromIndex: ", ", toIndex: ", ", size: "));
        } else {
            if (i2 <= i3) {
                return;
            }
            ay0.e(ev6.v("fromIndex: ", i2, i3, " > toIndex: "));
        }
    }

    public static r28 p(r28 r28Var, m68 m68Var, w06 w06Var, boolean z, vkb vkbVar, m45 m45Var, int i2) {
        r28 r28VarB;
        if ((i2 & 4) != 0) {
            z = true;
        }
        boolean z2 = z;
        if ((i2 & 16) != 0) {
            vkbVar = null;
        }
        vkb vkbVar2 = vkbVar;
        if (w06Var != null) {
            r28VarB = new ro1(m68Var, w06Var, false, z2, null, vkbVar2, m45Var);
        } else if (w06Var == null) {
            r28VarB = new ro1(m68Var, null, false, z2, null, vkbVar2, m45Var);
        } else {
            o28 o28Var = o28.b;
            r28VarB = m68Var != null ? s06.a(o28Var, m68Var, w06Var).b(new ro1(m68Var, null, false, z2, null, vkbVar2, m45Var)) : gx1.E(o28Var, new to1(w06Var, z2, vkbVar2, m45Var));
        }
        return r28Var.b(r28VarB);
    }

    public static r28 q(m45 m45Var) {
        return new v12(new so1(0, m45Var));
    }

    public static r28 r(r28 r28Var, boolean z, String str, vkb vkbVar, m45 m45Var, int i2) {
        if ((i2 & 1) != 0) {
            z = true;
        }
        return r28Var.b(new ro1(null, null, true, z, (i2 & 2) != 0 ? null : str, (i2 & 4) != 0 ? null : vkbVar, m45Var));
    }

    public static r28 s(r28 r28Var, m68 m68Var, m45 m45Var) {
        return r28Var.b(new aw1(m45Var, m68Var));
    }

    public static final String t(y28 y28Var, wz7 wz7Var) {
        wz7Var.getClass();
        yv2 yv2VarH = y28Var.h();
        yv2VarH.getClass();
        n98 name = y28Var.getName();
        n98 n98Var = olc.a;
        if (name == null || name.b) {
            name = olc.c;
        }
        String strC = name.c();
        if (!(yv2VarH instanceof wx8)) {
            y28 y28Var2 = yv2VarH instanceof y28 ? (y28) yv2VarH : null;
            if (y28Var2 != null) {
                return ev6.r('$', t(y28Var2, wz7Var), strC);
            }
            ywb.j("Unexpected container: ", yv2VarH, " for ", y28Var);
            return null;
        }
        y05 y05Var = ((xx8) ((wx8) yv2VarH)).f;
        if (y05Var.a.c()) {
            return strC;
        }
        return tuc.K(y05Var.a.a, '.', '/') + '/' + strC;
    }

    public static final void u(int i2, int i3) {
        if (i2 <= i3) {
            return;
        }
        z10.i(ev6.s(i2, i3, "toIndex (", ") is greater than size (", ")."));
    }

    public static CreateCredentialException v(String str, String str2) {
        Exception excZ;
        try {
            CreatePublicKeyCredentialDomException createPublicKeyCredentialDomException = new CreatePublicKeyCredentialDomException(new k(26), null);
            if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_ABORT_ERROR")) {
                excZ = gsa.Z(new k(0), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_CONSTRAINT_ERROR")) {
                excZ = gsa.Z(new k(1), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_DATA_CLONE_ERROR")) {
                excZ = gsa.Z(new k(2), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_DATA_ERROR")) {
                excZ = gsa.Z(new k(3), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_ENCODING_ERROR")) {
                excZ = gsa.Z(new k(4), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_HIERARCHY_REQUEST_ERROR")) {
                excZ = gsa.Z(new k(5), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_IN_USE_ATTRIBUTE_ERROR")) {
                excZ = gsa.Z(new k(6), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_CHARACTER_ERROR")) {
                excZ = gsa.Z(new k(7), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_MODIFICATION_ERROR")) {
                excZ = gsa.Z(new k(8), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_NODE_TYPE_ERROR")) {
                excZ = gsa.Z(new k(9), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_STATE_ERROR")) {
                excZ = gsa.Z(new k(10), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NAMESPACE_ERROR")) {
                excZ = gsa.Z(new k(11), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NETWORK_ERROR")) {
                excZ = gsa.Z(new k(12), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NO_MODIFICATION_ALLOWED_ERROR")) {
                excZ = gsa.Z(new k(13), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_ALLOWED_ERROR")) {
                excZ = gsa.Z(new k(14), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_FOUND_ERROR")) {
                excZ = gsa.Z(new k(15), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_READABLE_ERROR")) {
                excZ = gsa.Z(new k(16), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_SUPPORTED_ERROR")) {
                excZ = gsa.Z(new k(17), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_OPERATION_ERROR")) {
                excZ = gsa.Z(new k(18), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_OPT_OUT_ERROR")) {
                excZ = gsa.Z(new k(19), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_QUOTA_EXCEEDED_ERROR")) {
                excZ = gsa.Z(new k(20), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_READ_ONLY_ERROR")) {
                excZ = gsa.Z(new k(21), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_SECURITY_ERROR")) {
                excZ = gsa.Z(new k(22), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_SYNTAX_ERROR")) {
                excZ = gsa.Z(new k(23), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_TIMEOUT_ERROR")) {
                excZ = gsa.Z(new k(24), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_TRANSACTION_INACTIVE_ERROR")) {
                excZ = gsa.Z(new k(25), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_UNKNOWN_ERROR")) {
                excZ = gsa.Z(new k(26), str2, createPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_VERSION_ERROR")) {
                excZ = gsa.Z(new k(27), str2, createPublicKeyCredentialDomException);
            } else {
                if (!str.equals("androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_WRONG_DOCUMENT_ERROR")) {
                    throw new FrameworkClassParsingException();
                }
                excZ = gsa.Z(new k(28), str2, createPublicKeyCredentialDomException);
            }
            return (CreateCredentialException) excZ;
        } catch (FrameworkClassParsingException unused) {
            return new CreateCredentialCustomException(str2, str);
        }
    }

    public static boolean w(c41 c41Var, c41 c41Var2) {
        c41Var.getClass();
        c41Var2.getClass();
        if (!(c41Var2 instanceof g96) || !(c41Var instanceof s55)) {
            return false;
        }
        g96 g96Var = (g96) c41Var2;
        g96Var.I().size();
        s55 s55Var = (s55) c41Var;
        s55Var.I().size();
        List listI = g96Var.a().I();
        listI.getClass();
        List listI2 = s55Var.x0().I();
        listI2.getClass();
        for (f09 f09Var : bu1.t1(listI2, listI)) {
            lqe lqeVar = (lqe) f09Var.a;
            lqe lqeVar2 = (lqe) f09Var.b;
            lqeVar.getClass();
            boolean z = I((s55) c41Var2, lqeVar) instanceof lg6;
            lqeVar2.getClass();
            if (z != (I(s55Var, lqeVar2) instanceof lg6)) {
                return true;
            }
        }
        return false;
    }

    public static final long x(long j2) {
        long j3 = (j2 << 1) + 1;
        int i2 = in3.d;
        int i3 = kn3.a;
        return j3;
    }

    public static final long y(long j2) {
        return (-4611686018426L > j2 || j2 >= 4611686018427L) ? x(iq7.w(j2, -4611686018427387903L, 4611686018427387903L)) : z(j2 * 1000000);
    }

    public static final long z(long j2) {
        long j3 = j2 << 1;
        int i2 = in3.d;
        int i3 = kn3.a;
        return j3;
    }

    public abstract Object J();
}
