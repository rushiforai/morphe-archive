.class public Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;
    }
.end annotation


# static fields
.field public static CXFaceTriangulationIndexes:[I

.field public static CXFaceTriangulationIndexesWithCornerPoint:[I

.field static CXForeheadForSkinSmoothing:[I

.field private static ResourceIndices:Ljava/lang/String;

.field private static sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;


# instance fields
.field CXFaceEyeTrianglesIndices:[I

.field CXFaceEyesSampleLeftPointsIndices:[I

.field CXFaceEyesSampleRightPointsIndices:[I

.field CXFaceInsideMouthTrianglesIndices:[I

.field CXFaceLipsSamplePointsIndices:[I

.field CXFaceLipsTrianglesIndices:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x219

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 9
    .line 10
    const/16 v0, 0x246

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexesWithCornerPoint:[I

    .line 18
    .line 19
    const/16 v0, 0x3e

    .line 20
    .line 21
    new-array v0, v0, [I

    .line 22
    .line 23
    fill-array-data v0, :array_2

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXForeheadForSkinSmoothing:[I

    .line 27
    .line 28
    const-string v0, "{\"landmarks\":[0.17381913959980011,0.36590975522994995,0.17343476414680481,0.45132774114608765,0.17952266335487366,0.53483086824417114,0.19504062831401825,0.61835271120071411,0.22000625729560852,0.69837069511413574,0.25672107934951782,0.77097654342651367,0.30425351858139038,0.83225393295288086,0.35966679453849792,0.88374727964401245,0.42392188310623169,0.92303907871246338,0.5,0.93746602535247803,0.57607811689376831,0.92303907871246338,0.64033317565917969,0.88374727964401245,0.69574648141860962,0.83225393295288086,0.74327892065048218,0.77097654342651367,0.7799949049949646,0.69837069511413574,0.80495935678482056,0.61835271120071411,0.82047736644744873,0.53483086824417114,0.8265652060508728,0.45132774114608765,0.82618087530136108,0.36590975522994995,0.24124883115291595,0.30859804153442383,0.27332773804664612,0.27773436903953552,0.31262305378913879,0.26756834983825684,0.35610780119895935,0.26917734742164612,0.3964601457118988,0.27981209754943848,0.42941209673881531,0.30895546078681946,0.39010274410247803,0.30991172790527344,0.35250547528266907,0.30544686317443848,0.31406915187835693,0.30341249704360962,0.27819451689720154,0.30576211214065552,0.5705878734588623,0.30895546078681946,0.60353982448577881,0.27981209754943848,0.64389216899871826,0.26917734742164612,0.68737697601318359,0.26756834983825684,0.72667229175567627,0.27773436903953552,0.75875115394592285,0.30859804153442383,0.72180545330047607,0.30576211214065552,0.68593084812164307,0.30341249704360962,0.64749455451965332,0.30544686317443848,0.60989725589752197,0.30991172790527344,0.28534296154975891,0.39112147688865662,0.30294102430343628,0.37785467505455017,0.32349219918251038,0.37033006548881531,0.34780508279800415,0.36749881505966187,0.37202772498130798,0.37081524729728699,0.39217227697372437,0.37998515367507935,0.40819764137268066,0.39611953496932983,0.38928008079528809,0.40417501330375671,0.36902889609336853,0.40866446495056152,0.34640586376190186,0.41022539138793945,0.32359415292739868,0.40777969360351562,0.30373907089233398,0.40177264809608459,0.59180235862731934,0.39611953496932983,0.60782772302627563,0.37998515367507935,0.62797224521636963,0.37081524729728699,0.65219491720199585,0.36749881505966187,0.67650783061981201,0.37033006548881531,0.69705897569656372,0.37785467505455017,0.7146570086479187,0.39112147688865662,0.69626092910766602,0.40177264809608459,0.67640584707260132,0.40777969360351562,0.65359413623809814,0.41022539138793945,0.63097107410430908,0.40866446495056152,0.61071991920471191,0.40417501330375671,0.45767068862915039,0.38329803943634033,0.4549601674079895,0.45272812247276306,0.44386601448059082,0.5192297101020813,0.40819764137268066,0.55948829650878906,0.41915586590766907,0.60649454593658447,0.47767460346221924,0.6165691614151001,0.52232539653778076,0.6165691614151001,0.58084416389465332,0.60649454593658447,0.59180235862731934,0.55948829650878906,0.55613398551940918,0.5192297101020813,0.5450398325920105,0.45272812247276306,0.54232931137084961,0.38329803943634033,0.5,0.56499141454696655,0.37769374251365662,0.72207772731781006,0.41271290183067322,0.69964921474456787,0.45415157079696655,0.685555100440979,0.5,0.68645507097244263,0.54584842920303345,0.685555100440979,0.58728712797164917,0.69964921474456787,0.622306227684021,0.72207772731781006,0.59076994657516479,0.76110583543777466,0.55109494924545288,0.78622734546661377,0.5,0.79547578096389771,0.44890508055686951,0.78622734546661377,0.40923008322715759,0.76110583543777466,0.40211796760559082,0.7258874773979187,0.4501953125,0.71846014261245728,0.5,0.71899807453155518,0.5498046875,0.71846014261245728,0.59788203239440918,0.7258874773979187,0.55061328411102295,0.73992770910263062,0.5,0.74535119533538818,0.44938671588897705,0.73992770910263062,0.20532616972923279,0.19155703485012054,0.27824842929840088,0.14062969386577606,0.36244061589241028,0.10667707026004791,0.45339569449424744,0.089701056480407715,0.54660427570343018,0.089701056480407715,0.63755935430526733,0.10667707026004791,0.72175157070159912,0.14062969386577606,0.79467380046844482,0.19155703485012054]}"

    .line 29
    .line 30
    sput-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->ResourceIndices:Ljava/lang/String;

    .line 31
    .line 32
    return-void

    .line 33
    :array_0
    .array-data 4
        0x1
        0x0
        0x27
        0x1
        0x27
        0x32
        0x1
        0x32
        0x2
        0x0
        0x60
        0x13
        0x0
        0x13
        0x27
        0x2
        0x32
        0x31
        0x2
        0x31
        0x42
        0x2
        0x42
        0x3
        0x3
        0x42
        0x43
        0x3
        0x43
        0x4
        0x60
        0x61
        0x14
        0x60
        0x14
        0x13
        0x4
        0x43
        0x4c
        0x4
        0x4c
        0x5
        0x13
        0x14
        0x1c
        0x13
        0x1c
        0x27
        0x5
        0x4c
        0x6
        0x14
        0x61
        0x15
        0x14
        0x15
        0x1b
        0x14
        0x1b
        0x1c
        0x1c
        0x1b
        0x28
        0x1c
        0x28
        0x27
        0x61
        0x62
        0x16
        0x61
        0x16
        0x15
        0x27
        0x28
        0x32
        0x28
        0x1b
        0x29
        0x28
        0x29
        0x31
        0x28
        0x31
        0x32
        0x6
        0x4c
        0x57
        0x6
        0x57
        0x7
        0x15
        0x16
        0x1b
        0x1b
        0x16
        0x1a
        0x1b
        0x1a
        0x29
        0x29
        0x30
        0x31
        0x29
        0x1a
        0x2a
        0x29
        0x2a
        0x30
        0x31
        0x30
        0x42
        0x30
        0x2a
        0x2f
        0x30
        0x2f
        0x42
        0x2a
        0x1a
        0x2b
        0x2a
        0x2b
        0x2f
        0x1a
        0x16
        0x17
        0x1a
        0x17
        0x19
        0x1a
        0x19
        0x2b
        0x16
        0x62
        0x17
        0x7
        0x57
        0x56
        0x7
        0x56
        0x8
        0x62
        0x63
        0x17
        0x2f
        0x2b
        0x2c
        0x2f
        0x2c
        0x2e
        0x2f
        0x2e
        0x40
        0x2f
        0x40
        0x41
        0x2f
        0x41
        0x42
        0x2b
        0x19
        0x2c
        0x4c
        0x43
        0x4d
        0x4c
        0x4d
        0x58
        0x4c
        0x58
        0x57
        0x2e
        0x2c
        0x2d
        0x2e
        0x2d
        0x40
        0x19
        0x17
        0x18
        0x19
        0x18
        0x2c
        0x2c
        0x18
        0x3f
        0x2c
        0x3f
        0x2d
        0x17
        0x63
        0x18
        0x58
        0x4d
        0x59
        0x58
        0x59
        0x5f
        0x58
        0x5f
        0x57
        0x2d
        0x3f
        0x40
        0x42
        0x41
        0x4b
        0x42
        0x4b
        0x43
        0x57
        0x5f
        0x56
        0x4d
        0x43
        0x4e
        0x4d
        0x4e
        0x59
        0x43
        0x4b
        0x44
        0x43
        0x44
        0x4e
        0x8
        0x56
        0x55
        0x8
        0x55
        0x9
        0x18
        0x63
        0x64
        0x18
        0x64
        0x1d
        0x18
        0x1d
        0x4a
        0x18
        0x4a
        0x3f
        0x41
        0x40
        0x48
        0x41
        0x48
        0x4b
        0x56
        0x5f
        0x5e
        0x56
        0x5e
        0x55
        0x5f
        0x59
        0x5a
        0x5f
        0x5a
        0x5e
        0x59
        0x4e
        0x5a
        0x4e
        0x44
        0x4f
        0x4e
        0x4f
        0x5a
        0x40
        0x3f
        0x4a
        0x40
        0x4a
        0x49
        0x40
        0x49
        0x48
        0x44
        0x4b
        0x45
        0x44
        0x45
        0x4f
        0x4b
        0x48
        0x47
        0x4b
        0x47
        0x46
        0x4b
        0x46
        0x45
        0x4f
        0x45
        0x50
        0x4f
        0x50
        0x5a
        0x5a
        0x50
        0x5b
        0x5a
        0x5b
        0x5d
        0x5a
        0x5d
        0x5e
        0x5e
        0x5d
        0x54
        0x5e
        0x54
        0x55
        0x55
        0x54
        0xa
        0x55
        0xa
        0x9
        0x45
        0x46
        0x50
        0x4a
        0x1d
        0x34
        0x4a
        0x34
        0x33
        0x4a
        0x33
        0x49
        0x49
        0x33
        0x3e
        0x49
        0x3e
        0x3d
        0x49
        0x3d
        0x48
        0x50
        0x46
        0x51
        0x50
        0x51
        0x5b
        0x64
        0x65
        0x1e
        0x64
        0x1e
        0x1d
        0x5b
        0x51
        0x5c
        0x5b
        0x5c
        0x5d
        0x5d
        0x5c
        0x53
        0x5d
        0x53
        0x54
        0x54
        0x53
        0xb
        0x54
        0xb
        0xa
        0x48
        0x3d
        0x47
        0x1d
        0x1e
        0x26
        0x1d
        0x26
        0x34
        0x46
        0x47
        0xf
        0x46
        0xf
        0xe
        0x46
        0xe
        0x52
        0x46
        0x52
        0x51
        0x51
        0x52
        0x5c
        0x53
        0x5c
        0x52
        0x53
        0x52
        0xc
        0x53
        0xc
        0xb
        0x33
        0x34
        0x3e
        0x47
        0x3d
        0x3c
        0x47
        0x3c
        0x3b
        0x47
        0x3b
        0x10
        0x47
        0x10
        0xf
        0x1e
        0x65
        0x1f
        0x1e
        0x1f
        0x25
        0x1e
        0x25
        0x26
        0x34
        0x26
        0x35
        0x34
        0x35
        0x3d
        0x34
        0x3d
        0x3e
        0x26
        0x25
        0x35
        0x52
        0xe
        0xd
        0x52
        0xd
        0xc
        0x35
        0x25
        0x36
        0x35
        0x36
        0x3d
        0x3d
        0x36
        0x3c
        0x65
        0x66
        0x1f
        0x1f
        0x66
        0x20
        0x1f
        0x20
        0x24
        0x1f
        0x24
        0x25
        0x25
        0x24
        0x37
        0x25
        0x37
        0x36
        0x36
        0x37
        0x3c
        0x3c
        0x37
        0x3b
        0x3b
        0x37
        0x38
        0x3b
        0x38
        0x3a
        0x3b
        0x3a
        0x10
        0x37
        0x24
        0x38
        0x24
        0x20
        0x21
        0x24
        0x21
        0x23
        0x24
        0x23
        0x38
        0x20
        0x66
        0x21
        0x3a
        0x38
        0x39
        0x3a
        0x39
        0x11
        0x3a
        0x11
        0x10
        0x38
        0x23
        0x39
        0x39
        0x23
        0x22
        0x39
        0x22
        0x12
        0x39
        0x12
        0x11
        0x66
        0x67
        0x21
        0x23
        0x21
        0x22
        0x21
        0x67
        0x22
        0x22
        0x67
        0x12
    .end array-data

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    :array_1
    .array-data 4
        0x0
        0x1
        0x60
        0x1
        0x2
        0x60
        0x16
        0x15
        0x60
        0x15
        0x14
        0x60
        0x14
        0x13
        0x60
        0x13
        0x0
        0x60
        0x18
        0x17
        0x1d
        0x20
        0x21
        0x24
        0x21
        0x23
        0x24
        0x1d
        0x1e
        0x26
        0x1e
        0x1f
        0x26
        0x1f
        0x25
        0x26
        0x1f
        0x20
        0x25
        0x20
        0x24
        0x25
        0x21
        0x22
        0x23
        0x11
        0x12
        0x61
        0x12
        0x22
        0x61
        0x22
        0x21
        0x61
        0x21
        0x20
        0x61
        0x20
        0x1f
        0x61
        0x1f
        0x16
        0x61
        0x16
        0x60
        0x61
        0x1e
        0x17
        0x1f
        0x17
        0x16
        0x1f
        0x1d
        0x17
        0x1e
        0x13
        0x14
        0x1c
        0x14
        0x15
        0x1c
        0x15
        0x1b
        0x1c
        0x15
        0x16
        0x1b
        0x16
        0x1a
        0x1b
        0x16
        0x17
        0x1a
        0x17
        0x19
        0x1a
        0x1
        0x0
        0x27
        0x0
        0x13
        0x27
        0x13
        0x1c
        0x27
        0x11
        0x10
        0x39
        0x33
        0x34
        0x3e
        0x34
        0x3d
        0x3e
        0x34
        0x35
        0x3d
        0x35
        0x3c
        0x3d
        0x35
        0x36
        0x3c
        0x36
        0x37
        0x3c
        0x37
        0x3b
        0x3c
        0x37
        0x3a
        0x3b
        0x3a
        0x10
        0x3b
        0x10
        0xf
        0x3b
        0x37
        0x38
        0x3a
        0x38
        0x39
        0x3a
        0x39
        0x10
        0x3a
        0x38
        0x23
        0x39
        0x23
        0x22
        0x39
        0x22
        0x12
        0x39
        0x12
        0x11
        0x39
        0x37
        0x24
        0x38
        0x24
        0x23
        0x38
        0x36
        0x24
        0x37
        0x35
        0x25
        0x36
        0x25
        0x24
        0x36
        0x34
        0x26
        0x35
        0x26
        0x25
        0x35
        0x33
        0x1d
        0x34
        0x1d
        0x26
        0x34
        0x2d
        0x18
        0x3f
        0x18
        0x1d
        0x3f
        0x1d
        0x33
        0x4a
        0x33
        0x49
        0x4a
        0x49
        0x3f
        0x4a
        0x3f
        0x1d
        0x4a
        0x4
        0x3
        0x42
        0x3
        0x2
        0x42
        0x2
        0x30
        0x42
        0x30
        0x41
        0x42
        0x6
        0x5
        0x4c
        0x5
        0x4
        0x4c
        0x4
        0x42
        0x4c
        0xd
        0xc
        0x52
        0x6
        0x4c
        0x57
        0x4c
        0x4d
        0x58
        0x4d
        0x58
        0x59
        0x5f
        0x58
        0x59
        0x57
        0x4c
        0x58
        0x4d
        0x4e
        0x59
        0x56
        0x7
        0x57
        0x7
        0x6
        0x57
        0x55
        0x8
        0x56
        0x8
        0x7
        0x56
        0x4f
        0x50
        0x5a
        0x56
        0x57
        0x5f
        0x57
        0x58
        0x5f
        0x59
        0x5a
        0x5f
        0x4f
        0x5a
        0x59
        0x59
        0x4f
        0x4e
        0x5a
        0x5e
        0x5f
        0x5e
        0x55
        0x5f
        0x55
        0x56
        0x5f
        0x54
        0xa
        0x55
        0xa
        0x9
        0x55
        0x9
        0x8
        0x55
        0x50
        0x51
        0x5b
        0x5a
        0x5b
        0x5e
        0x5b
        0x5d
        0x5e
        0x5d
        0x54
        0x5e
        0x54
        0x55
        0x5e
        0x5b
        0x5c
        0x5d
        0x5d
        0x53
        0x5c
        0x5c
        0x5b
        0x51
        0x53
        0x54
        0x5d
        0x5a
        0x50
        0x5b
        0x53
        0xb
        0x54
        0xb
        0xa
        0x54
        0x51
        0x52
        0x5c
        0x52
        0x53
        0x5c
        0x52
        0xc
        0x53
        0xc
        0xb
        0x53
        0x51
        0x47
        0x52
        0x47
        0xe
        0x52
        0xe
        0xd
        0x52
        0x50
        0x46
        0x51
        0x46
        0x47
        0x51
        0x4f
        0x45
        0x50
        0x45
        0x46
        0x50
        0x4e
        0x44
        0x4f
        0x44
        0x45
        0x4f
        0x4d
        0x43
        0x4e
        0x43
        0x44
        0x4e
        0x4c
        0x42
        0x4d
        0x42
        0x43
        0x4d
        0x42
        0x41
        0x43
        0x3c
        0x3b
        0x47
        0x3b
        0xf
        0x47
        0xf
        0xe
        0x47
        0x40
        0x3f
        0x49
        0x33
        0x3e
        0x49
        0x3e
        0x3d
        0x49
        0x3d
        0x48
        0x49
        0x3d
        0x3c
        0x48
        0x3c
        0x47
        0x48
        0x47
        0x46
        0x48
        0x44
        0x43
        0x4b
        0x43
        0x41
        0x4b
        0x41
        0x40
        0x4b
        0x40
        0x49
        0x4b
        0x49
        0x48
        0x4b
        0x48
        0x46
        0x4b
        0x46
        0x45
        0x4b
        0x45
        0x44
        0x4b
        0x30
        0x2f
        0x41
        0x2f
        0x40
        0x41
        0x2f
        0x2e
        0x40
        0x2e
        0x2d
        0x40
        0x2d
        0x3f
        0x40
        0x1
        0x27
        0x32
        0x27
        0x28
        0x32
        0x28
        0x31
        0x32
        0x31
        0x1
        0x32
        0x28
        0x29
        0x31
        0x29
        0x2a
        0x31
        0x2a
        0x30
        0x31
        0x30
        0x2
        0x31
        0x2
        0x1
        0x31
        0x2a
        0x2b
        0x30
        0x2b
        0x2f
        0x30
        0x2b
        0x2c
        0x2f
        0x2c
        0x2e
        0x2f
        0x2c
        0x2d
        0x2e
        0x2c
        0x18
        0x2d
        0x2b
        0x19
        0x2c
        0x19
        0x18
        0x2c
        0x2a
        0x1a
        0x2b
        0x1a
        0x19
        0x2b
        0x29
        0x1b
        0x2a
        0x1b
        0x1a
        0x2a
        0x28
        0x1c
        0x29
        0x1c
        0x1b
        0x29
        0x27
        0x1c
        0x28
        0x17
        0x18
        0x19
        0x9
        0xa
        0x62
        0xa
        0xb
        0x62
        0xb
        0xc
        0x62
        0xc
        0xd
        0x62
        0xd
        0xe
        0x62
        0xe
        0xf
        0x62
        0xf
        0x10
        0x62
        0x10
        0x11
        0x62
        0x11
        0x61
        0x62
        0x60
        0x2
        0x63
        0x2
        0x3
        0x63
        0x3
        0x4
        0x63
        0x4
        0x5
        0x63
        0x5
        0x6
        0x63
        0x6
        0x7
        0x63
        0x7
        0x8
        0x63
        0x8
        0x9
        0x63
        0x9
        0x62
        0x63
    .end array-data

    :array_2
    .array-data 4
        0x3
        0xb
        0xa
        0x11
        0x17
        0x16
        0x2c
        0x2f
        0x3f
        0x4d
        0x4e
        0x75
        0x74
        0x8c
        0x98
        0x99
        0xa7
        0xaf
        0xb1
        0xb2
        0xe
        0x13
        0x12
        0x1e
        0x1f
        0x29
        0x2a
        0x3b
        0x3d
        0x50
        0x4f
        0x6c
        0x7d
        0x8e
        0x8d
        0x9b
        0x9a
        0xa4
        0xa5
        0xb0
        0xf
        0x15
        0x14
        0x19
        0x20
        0x22
        0x27
        0x2b
        0x35
        0x3c
        0x7e
        0x8f
        0x92
        0x95
        0x9d
        0x9c
        0xa3
        0xa6
        0xab
        0xac
        0x6d
        0x3e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x14

    .line 5
    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceLipsTrianglesIndices:[I

    .line 12
    .line 13
    const/4 v1, 0x6

    .line 14
    new-array v1, v1, [I

    .line 15
    .line 16
    fill-array-data v1, :array_1

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceInsideMouthTrianglesIndices:[I

    .line 20
    .line 21
    new-array v0, v0, [I

    .line 22
    .line 23
    fill-array-data v0, :array_2

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceEyeTrianglesIndices:[I

    .line 27
    .line 28
    const/16 v0, 0x32

    .line 29
    .line 30
    new-array v0, v0, [I

    .line 31
    .line 32
    fill-array-data v0, :array_3

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceLipsSamplePointsIndices:[I

    .line 36
    .line 37
    const/16 v0, 0xc

    .line 38
    .line 39
    new-array v0, v0, [I

    .line 40
    .line 41
    fill-array-data v0, :array_4

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceEyesSampleLeftPointsIndices:[I

    .line 45
    .line 46
    const/16 v0, 0xc

    .line 47
    .line 48
    new-array v0, v0, [I

    .line 49
    .line 50
    fill-array-data v0, :array_5

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceEyesSampleRightPointsIndices:[I

    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x37
        0x38
        0x40
        0x42
        0x48
        0x46
        0x57
        0x53
        0x59
        0x63
        0x64
        0x67
        0x68
        0x73
        0x76
        0x78
        0x79
        0x83
        0x84
        0x54
    .end array-data

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    :array_1
    .array-data 4
        0x41
        0x56
        0x55
        0x66
        0x65
        0x77
    .end array-data

    :array_2
    .array-data 4
        0x18
        0x1a
        0x1b
        0x21
        0x23
        0x25
        0x28
        0x30
        0x31
        0x39
        0x87
        0x91
        0x90
        0x96
        0x97
        0x9e
        0x9f
        0xa0
        0xa1
        0xa8
    .end array-data

    :array_3
    .array-data 4
        0x4c
        0x58
        0x4d
        0x58
        0x4d
        0x59
        0x4e
        0x59
        0x4e
        0x5a
        0x4f
        0x5b
        0x4f
        0x5a
        0x50
        0x5b
        0x50
        0x5a
        0x50
        0x5c
        0x51
        0x5b
        0x51
        0x5c
        0x52
        0x5c
        0x53
        0x5d
        0x53
        0x5c
        0x54
        0x5e
        0x54
        0x5d
        0x55
        0x5d
        0x55
        0x5e
        0x55
        0x5f
        0x56
        0x5f
        0x56
        0x5e
        0x56
        0x58
        0x57
        0x5f
        0x57
        0x58
    .end array-data

    :array_4
    .array-data 4
        0x27
        0x2d
        0x28
        0x32
        0x29
        0x31
        0x2a
        0x30
        0x2b
        0x2f
        0x2c
        0x2e
    .end array-data

    :array_5
    .array-data 4
        0x33
        0x39
        0x34
        0x3e
        0x35
        0x3d
        0x36
        0x3c
        0x37
        0x3b
        0x38
        0x3a
    .end array-data
.end method

.method public static getFaceLocalTriangulation([F[IZ)[[F
    .locals 13

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    move p2, v1

    .line 10
    :goto_0
    sget-object v2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 11
    .line 12
    array-length v2, v2

    .line 13
    if-ge p2, v2, :cond_3

    .line 14
    .line 15
    filled-new-array {p1}, [[I

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    div-int/lit8 v3, p2, 0x3

    .line 24
    .line 25
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    sget-object v2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 36
    .line 37
    aget v2, v2, p2

    .line 38
    .line 39
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move p2, v1

    .line 50
    :goto_1
    sget-object v2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 51
    .line 52
    array-length v2, v2

    .line 53
    if-ge p2, v2, :cond_3

    .line 54
    .line 55
    filled-new-array {p1}, [[I

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    div-int/lit8 v3, p2, 0x3

    .line 64
    .line 65
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    sget-object v2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 76
    .line 77
    aget v2, v2, p2

    .line 78
    .line 79
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    const/4 p2, 0x2

    .line 94
    mul-int/2addr p1, p2

    .line 95
    new-array v2, p2, [I

    .line 96
    .line 97
    const/4 v3, 0x1

    .line 98
    aput p1, v2, v3

    .line 99
    .line 100
    const/4 p1, 0x3

    .line 101
    aput p1, v2, v1

    .line 102
    .line 103
    sget-object p1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 104
    .line 105
    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, [[F

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    mul-int/2addr v2, p2

    .line 116
    new-array v2, v2, [F

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    mul-int/2addr v4, p2

    .line 123
    new-array v4, v4, [F

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    mul-int/2addr v5, p2

    .line 130
    new-array v5, v5, [F

    .line 131
    .line 132
    sget-object v6, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 133
    .line 134
    if-nez v6, :cond_4

    .line 135
    .line 136
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    sget-object v7, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->ResourceIndices:Ljava/lang/String;

    .line 141
    .line 142
    const-class v8, Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 143
    .line 144
    invoke-virtual {v6, v7, v8}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    check-cast v6, Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 149
    .line 150
    sput-object v6, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 151
    .line 152
    :cond_4
    move v6, v1

    .line 153
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    if-ge v6, v7, :cond_5

    .line 158
    .line 159
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    check-cast v7, Ljava/lang/Integer;

    .line 164
    .line 165
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    aget v7, p0, v7

    .line 170
    .line 171
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v8

    .line 175
    check-cast v8, Ljava/lang/Integer;

    .line 176
    .line 177
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    add-int/lit8 v8, v8, 0x68

    .line 182
    .line 183
    aget v8, p0, v8

    .line 184
    .line 185
    mul-int/lit8 v9, v6, 0x2

    .line 186
    .line 187
    const/high16 v10, 0x40000000    # 2.0f

    .line 188
    .line 189
    mul-float v11, v7, v10

    .line 190
    .line 191
    const/high16 v12, 0x3f800000    # 1.0f

    .line 192
    .line 193
    sub-float/2addr v11, v12

    .line 194
    aput v11, v2, v9

    .line 195
    .line 196
    add-int/lit8 v11, v9, 0x1

    .line 197
    .line 198
    mul-float/2addr v10, v8

    .line 199
    sub-float/2addr v10, v12

    .line 200
    neg-float v10, v10

    .line 201
    aput v10, v2, v11

    .line 202
    .line 203
    aput v7, v4, v9

    .line 204
    .line 205
    sub-float/2addr v12, v8

    .line 206
    aput v12, v4, v11

    .line 207
    .line 208
    sget-object v7, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 209
    .line 210
    invoke-virtual {v7}, Lcom/momo/mcamera/mask/LandMarksEntity;->getLandmarks()[F

    .line 211
    .line 212
    .line 213
    move-result-object v7

    .line 214
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    check-cast v8, Ljava/lang/Integer;

    .line 219
    .line 220
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 221
    .line 222
    .line 223
    move-result v8

    .line 224
    mul-int/2addr v8, p2

    .line 225
    aget v7, v7, v8

    .line 226
    .line 227
    aput v7, v5, v9

    .line 228
    .line 229
    sget-object v7, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 230
    .line 231
    invoke-virtual {v7}, Lcom/momo/mcamera/mask/LandMarksEntity;->getLandmarks()[F

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    check-cast v8, Ljava/lang/Integer;

    .line 240
    .line 241
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 242
    .line 243
    .line 244
    move-result v8

    .line 245
    mul-int/2addr v8, p2

    .line 246
    add-int/2addr v8, v3

    .line 247
    aget v7, v7, v8

    .line 248
    .line 249
    aput v7, v5, v11

    .line 250
    .line 251
    add-int/lit8 v6, v6, 0x1

    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_5
    aput-object v2, p1, v1

    .line 255
    .line 256
    aput-object v4, p1, v3

    .line 257
    .line 258
    aput-object v5, p1, p2

    .line 259
    .line 260
    return-object p1
.end method

.method public static getFaceSkinHead([FZ)[[F
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object p1, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXForeheadForSkinSmoothing:[I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p1, v0}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceLocalTriangulation([F[IZ)[[F

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static getFaceTriangulation([F)[[F
    .locals 15

    .line 149
    sget-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    array-length v0, v0

    const/4 v1, 0x2

    mul-int/2addr v0, v1

    new-array v2, v1, [I

    const/4 v3, 0x1

    aput v0, v2, v3

    const/4 v0, 0x0

    const/4 v4, 0x3

    aput v4, v2, v0

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[F

    .line 150
    sget-object v4, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    array-length v5, v4

    mul-int/2addr v5, v1

    new-array v5, v5, [F

    .line 151
    array-length v6, v4

    mul-int/2addr v6, v1

    new-array v6, v6, [F

    .line 152
    array-length v4, v4

    mul-int/2addr v4, v1

    new-array v4, v4, [F

    .line 153
    array-length v7, p0

    .line 154
    sget-object v7, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    if-nez v7, :cond_0

    .line 155
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    move-result-object v7

    sget-object v8, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->ResourceIndices:Ljava/lang/String;

    const-class v9, Lcom/momo/mcamera/mask/LandMarksEntity;

    invoke-virtual {v7, v8, v9}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/momo/mcamera/mask/LandMarksEntity;

    sput-object v7, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    :cond_0
    move v7, v0

    .line 156
    :goto_0
    sget-object v8, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    array-length v9, v8

    if-ge v7, v9, :cond_1

    .line 157
    aget v8, v8, v7

    .line 158
    aget v9, p0, v8

    add-int/lit8 v10, v8, 0x68

    .line 159
    aget v10, p0, v10

    mul-int/lit8 v11, v7, 0x2

    .line 160
    aput v9, v6, v11

    add-int/lit8 v12, v11, 0x1

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float v14, v13, v10

    .line 161
    aput v14, v6, v12

    const/high16 v14, 0x40000000    # 2.0f

    mul-float/2addr v9, v14

    sub-float/2addr v9, v13

    .line 162
    aput v9, v5, v11

    mul-float/2addr v10, v14

    sub-float/2addr v10, v13

    neg-float v9, v10

    .line 163
    aput v9, v5, v12

    .line 164
    sget-object v9, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    invoke-virtual {v9}, Lcom/momo/mcamera/mask/LandMarksEntity;->getLandmarks()[F

    move-result-object v9

    mul-int/2addr v8, v1

    aget v9, v9, v8

    aput v9, v4, v11

    .line 165
    sget-object v9, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    invoke-virtual {v9}, Lcom/momo/mcamera/mask/LandMarksEntity;->getLandmarks()[F

    move-result-object v9

    add-int/2addr v8, v3

    aget v8, v9, v8

    aput v8, v4, v12

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 166
    :cond_1
    aput-object v5, v2, v0

    .line 167
    aput-object v6, v2, v3

    .line 168
    aput-object v4, v2, v1

    return-object v2
.end method

.method public static getFaceTriangulation([FII[F)[[F
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-nez p3, :cond_1

    .line 4
    .line 5
    sget-object v1, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->ResourceIndices:Ljava/lang/String;

    .line 14
    .line 15
    const-class v3, Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 22
    .line 23
    sput-object v1, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 24
    .line 25
    :cond_0
    sget-object v1, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/LandMarksEntity;->getLandmarks()[F

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move-object/from16 v1, p3

    .line 33
    .line 34
    :goto_0
    array-length v2, v1

    .line 35
    const/16 v3, 0xc0

    .line 36
    .line 37
    if-ne v2, v3, :cond_2

    .line 38
    .line 39
    invoke-static {v1}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;->access$000([F)[F

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :cond_2
    sget-object v2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 44
    .line 45
    array-length v2, v2

    .line 46
    const/4 v3, 0x2

    .line 47
    mul-int/2addr v2, v3

    .line 48
    new-array v4, v3, [I

    .line 49
    .line 50
    const/4 v5, 0x1

    .line 51
    aput v2, v4, v5

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    const/4 v6, 0x3

    .line 55
    aput v6, v4, v2

    .line 56
    .line 57
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 58
    .line 59
    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, [[F

    .line 64
    .line 65
    sget-object v6, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 66
    .line 67
    array-length v7, v6

    .line 68
    mul-int/2addr v7, v3

    .line 69
    new-array v7, v7, [F

    .line 70
    .line 71
    array-length v8, v6

    .line 72
    mul-int/2addr v8, v3

    .line 73
    new-array v8, v8, [F

    .line 74
    .line 75
    array-length v6, v6

    .line 76
    mul-int/2addr v6, v3

    .line 77
    new-array v6, v6, [F

    .line 78
    .line 79
    array-length v9, v0

    .line 80
    move v9, v2

    .line 81
    :goto_1
    sget-object v10, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 82
    .line 83
    array-length v11, v10

    .line 84
    if-ge v9, v11, :cond_3

    .line 85
    .line 86
    aget v10, v10, v9

    .line 87
    .line 88
    aget v11, v0, v10

    .line 89
    .line 90
    move/from16 v12, p1

    .line 91
    .line 92
    int-to-float v13, v12

    .line 93
    div-float/2addr v11, v13

    .line 94
    add-int/lit8 v13, v10, 0x68

    .line 95
    .line 96
    aget v13, v0, v13

    .line 97
    .line 98
    move/from16 v14, p2

    .line 99
    .line 100
    int-to-float v15, v14

    .line 101
    div-float/2addr v13, v15

    .line 102
    mul-int/lit8 v15, v9, 0x2

    .line 103
    .line 104
    aput v11, v8, v15

    .line 105
    .line 106
    add-int/lit8 v16, v15, 0x1

    .line 107
    .line 108
    const/high16 v17, 0x3f800000    # 1.0f

    .line 109
    .line 110
    sub-float v18, v17, v13

    .line 111
    .line 112
    aput v18, v8, v16

    .line 113
    .line 114
    const/high16 v18, 0x40000000    # 2.0f

    .line 115
    .line 116
    mul-float v11, v11, v18

    .line 117
    .line 118
    sub-float v11, v11, v17

    .line 119
    .line 120
    aput v11, v7, v15

    .line 121
    .line 122
    mul-float v13, v13, v18

    .line 123
    .line 124
    sub-float v13, v13, v17

    .line 125
    .line 126
    neg-float v11, v13

    .line 127
    aput v11, v7, v16

    .line 128
    .line 129
    mul-int/2addr v10, v3

    .line 130
    aget v11, v1, v10

    .line 131
    .line 132
    aput v11, v6, v15

    .line 133
    .line 134
    add-int/2addr v10, v5

    .line 135
    aget v10, v1, v10

    .line 136
    .line 137
    aput v10, v6, v16

    .line 138
    .line 139
    add-int/lit8 v9, v9, 0x1

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_3
    aput-object v7, v4, v2

    .line 143
    .line 144
    aput-object v8, v4, v5

    .line 145
    .line 146
    aput-object v6, v4, v3

    .line 147
    .line 148
    return-object v4
.end method

.method public static getFaceTriangulationBoundingBox([[FII)[[F
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [I

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    const/16 v4, 0x8

    .line 8
    .line 9
    aput v4, v2, v3

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    aput v1, v2, v5

    .line 13
    .line 14
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 15
    .line 16
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, [[F

    .line 21
    .line 22
    move/from16 v6, p1

    .line 23
    .line 24
    int-to-float v6, v6

    .line 25
    move/from16 v7, p2

    .line 26
    .line 27
    int-to-float v7, v7

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    array-length v8, v0

    .line 31
    if-lez v8, :cond_2

    .line 32
    .line 33
    aget-object v8, v0, v5

    .line 34
    .line 35
    array-length v8, v8

    .line 36
    div-int/2addr v8, v1

    .line 37
    const/high16 v9, -0x40800000    # -1.0f

    .line 38
    .line 39
    move v11, v5

    .line 40
    move v12, v6

    .line 41
    move v13, v7

    .line 42
    move v10, v9

    .line 43
    :goto_0
    array-length v14, v0

    .line 44
    if-ge v11, v14, :cond_1

    .line 45
    .line 46
    aget-object v14, v0, v11

    .line 47
    .line 48
    move/from16 v16, v1

    .line 49
    .line 50
    move v15, v5

    .line 51
    :goto_1
    array-length v1, v14

    .line 52
    div-int/lit8 v1, v1, 0x2

    .line 53
    .line 54
    if-ge v15, v1, :cond_0

    .line 55
    .line 56
    aget v1, v14, v15

    .line 57
    .line 58
    invoke-static {v1, v12}, Ljava/lang/Math;->min(FF)F

    .line 59
    .line 60
    .line 61
    move-result v12

    .line 62
    add-int v1, v15, v8

    .line 63
    .line 64
    move/from16 v17, v3

    .line 65
    .line 66
    aget v3, v14, v1

    .line 67
    .line 68
    invoke-static {v3, v13}, Ljava/lang/Math;->min(FF)F

    .line 69
    .line 70
    .line 71
    move-result v13

    .line 72
    aget v3, v14, v15

    .line 73
    .line 74
    invoke-static {v3, v10}, Ljava/lang/Math;->max(FF)F

    .line 75
    .line 76
    .line 77
    move-result v10

    .line 78
    aget v1, v14, v1

    .line 79
    .line 80
    invoke-static {v1, v9}, Ljava/lang/Math;->max(FF)F

    .line 81
    .line 82
    .line 83
    move-result v9

    .line 84
    add-int/lit8 v15, v15, 0x1

    .line 85
    .line 86
    move/from16 v3, v17

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_0
    move/from16 v17, v3

    .line 90
    .line 91
    add-int/lit8 v11, v11, 0x1

    .line 92
    .line 93
    move/from16 v1, v16

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    move/from16 v16, v1

    .line 97
    .line 98
    move/from16 v17, v3

    .line 99
    .line 100
    div-float/2addr v12, v6

    .line 101
    div-float/2addr v13, v7

    .line 102
    const/high16 v0, 0x3f800000    # 1.0f

    .line 103
    .line 104
    sub-float v1, v0, v13

    .line 105
    .line 106
    div-float/2addr v9, v7

    .line 107
    sub-float v3, v0, v9

    .line 108
    .line 109
    div-float/2addr v10, v6

    .line 110
    new-array v6, v4, [F

    .line 111
    .line 112
    aput v12, v6, v5

    .line 113
    .line 114
    aput v1, v6, v17

    .line 115
    .line 116
    aput v12, v6, v16

    .line 117
    .line 118
    const/4 v7, 0x3

    .line 119
    aput v3, v6, v7

    .line 120
    .line 121
    const/4 v8, 0x4

    .line 122
    aput v10, v6, v8

    .line 123
    .line 124
    const/4 v11, 0x5

    .line 125
    aput v1, v6, v11

    .line 126
    .line 127
    const/4 v1, 0x6

    .line 128
    aput v10, v6, v1

    .line 129
    .line 130
    const/4 v14, 0x7

    .line 131
    aput v3, v6, v14

    .line 132
    .line 133
    const/high16 v3, 0x40000000    # 2.0f

    .line 134
    .line 135
    mul-float/2addr v12, v3

    .line 136
    sub-float/2addr v12, v0

    .line 137
    mul-float/2addr v13, v3

    .line 138
    sub-float/2addr v13, v0

    .line 139
    neg-float v13, v13

    .line 140
    mul-float/2addr v9, v3

    .line 141
    sub-float/2addr v9, v0

    .line 142
    neg-float v9, v9

    .line 143
    mul-float/2addr v10, v3

    .line 144
    sub-float/2addr v10, v0

    .line 145
    new-array v0, v4, [F

    .line 146
    .line 147
    aput v12, v0, v5

    .line 148
    .line 149
    aput v13, v0, v17

    .line 150
    .line 151
    aput v12, v0, v16

    .line 152
    .line 153
    aput v9, v0, v7

    .line 154
    .line 155
    aput v10, v0, v8

    .line 156
    .line 157
    aput v13, v0, v11

    .line 158
    .line 159
    aput v10, v0, v1

    .line 160
    .line 161
    aput v9, v0, v14

    .line 162
    .line 163
    aput-object v0, v2, v5

    .line 164
    .line 165
    aput-object v6, v2, v17

    .line 166
    .line 167
    return-object v2

    .line 168
    :cond_2
    const-string v0, "104\u70b9\u4e3a\u7a7a"

    .line 169
    .line 170
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    const/4 v0, 0x0

    .line 174
    return-object v0
.end method

.method public static getFaceTriangulationWidth([F)F
    .locals 2

    if-eqz p0, :cond_0

    .line 51
    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 52
    aget v0, p0, v0

    const/16 v1, 0x12

    aget p0, p0, v1

    sub-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    return p0

    .line 53
    :cond_0
    const-string p0, "104\u70b9\u4e3a\u7a7a"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static getFaceTriangulationWidth([FF)F
    .locals 6

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    aget v0, p0, v0

    .line 8
    .line 9
    const/16 v1, 0x68

    .line 10
    .line 11
    aget v1, p0, v1

    .line 12
    .line 13
    const/16 v2, 0x12

    .line 14
    .line 15
    aget v2, p0, v2

    .line 16
    .line 17
    const/16 v3, 0x7a

    .line 18
    .line 19
    aget p0, p0, v3

    .line 20
    .line 21
    sub-float/2addr v0, v2

    .line 22
    float-to-double v2, v0

    .line 23
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 24
    .line 25
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    sub-float/2addr v1, p0

    .line 30
    float-to-double v0, v1

    .line 31
    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    add-double/2addr v2, v0

    .line 36
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    float-to-double p0, p1

    .line 41
    mul-double/2addr v0, p0

    .line 42
    double-to-float p0, v0

    .line 43
    return p0

    .line 44
    :cond_0
    const-string p0, "104\u70b9\u4e3a\u7a7a"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public static getFaceTriangulationWithCornerPoint([F[F)[[F
    .locals 16

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexesWithCornerPoint:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x2

    .line 5
    mul-int/2addr v0, v1

    .line 6
    new-array v2, v1, [I

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    aput v0, v2, v3

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v4, 0x3

    .line 13
    aput v4, v2, v0

    .line 14
    .line 15
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, [[F

    .line 22
    .line 23
    sget-object v4, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexesWithCornerPoint:[I

    .line 24
    .line 25
    array-length v5, v4

    .line 26
    mul-int/2addr v5, v1

    .line 27
    new-array v5, v5, [F

    .line 28
    .line 29
    array-length v6, v4

    .line 30
    mul-int/2addr v6, v1

    .line 31
    new-array v6, v6, [F

    .line 32
    .line 33
    array-length v4, v4

    .line 34
    mul-int/2addr v4, v1

    .line 35
    new-array v4, v4, [F

    .line 36
    .line 37
    move v7, v0

    .line 38
    :goto_0
    sget-object v8, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexesWithCornerPoint:[I

    .line 39
    .line 40
    array-length v9, v8

    .line 41
    if-ge v7, v9, :cond_0

    .line 42
    .line 43
    aget v8, v8, v7

    .line 44
    .line 45
    mul-int/2addr v8, v1

    .line 46
    aget v9, p0, v8

    .line 47
    .line 48
    add-int/lit8 v10, v8, 0x1

    .line 49
    .line 50
    aget v11, p0, v10

    .line 51
    .line 52
    mul-int/lit8 v12, v7, 0x2

    .line 53
    .line 54
    aput v9, v6, v12

    .line 55
    .line 56
    add-int/lit8 v13, v12, 0x1

    .line 57
    .line 58
    const/high16 v14, 0x3f800000    # 1.0f

    .line 59
    .line 60
    sub-float v15, v14, v11

    .line 61
    .line 62
    aput v15, v6, v13

    .line 63
    .line 64
    const/high16 v15, 0x40000000    # 2.0f

    .line 65
    .line 66
    mul-float/2addr v9, v15

    .line 67
    sub-float/2addr v9, v14

    .line 68
    aput v9, v5, v12

    .line 69
    .line 70
    mul-float/2addr v11, v15

    .line 71
    sub-float/2addr v11, v14

    .line 72
    neg-float v9, v11

    .line 73
    aput v9, v5, v13

    .line 74
    .line 75
    aget v8, p1, v8

    .line 76
    .line 77
    aput v8, v4, v12

    .line 78
    .line 79
    aget v8, p1, v10

    .line 80
    .line 81
    aput v8, v4, v13

    .line 82
    .line 83
    add-int/lit8 v7, v7, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    aput-object v5, v2, v0

    .line 87
    .line 88
    aput-object v6, v2, v3

    .line 89
    .line 90
    aput-object v4, v2, v1

    .line 91
    .line 92
    return-object v2
.end method

.method public static getfaceSkinBelowHead([FZ)[[F
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object p1, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXForeheadForSkinSmoothing:[I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p0, p1, v0}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceLocalTriangulation([F[IZ)[[F

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static setSourceLandMark([F)V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momo/mcamera/mask/LandMarksEntity;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->sourceLandMark:Lcom/momo/mcamera/mask/LandMarksEntity;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/LandMarksEntity;->setLandmarks([F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public getFaceLocalBoundingBox([F[I)[Landroid/graphics/RectF;
    .locals 9

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceLocalTriangulation([F[I)[[F

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length p1, p0

    .line 6
    new-array p1, p1, [Landroid/graphics/RectF;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    move v0, p2

    .line 10
    :goto_0
    array-length v1, p0

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    const/high16 v1, -0x40800000    # -1.0f

    .line 14
    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    move v5, p2

    .line 18
    move v3, v2

    .line 19
    move v4, v3

    .line 20
    move v2, v1

    .line 21
    :goto_1
    aget-object v6, p0, v0

    .line 22
    .line 23
    array-length v7, v6

    .line 24
    div-int/lit8 v7, v7, 0x2

    .line 25
    .line 26
    if-ge v5, v7, :cond_0

    .line 27
    .line 28
    mul-int/lit8 v7, v5, 0x2

    .line 29
    .line 30
    aget v6, v6, v7

    .line 31
    .line 32
    invoke-static {v6, v3}, Ljava/lang/Math;->min(FF)F

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    aget-object v6, p0, v0

    .line 37
    .line 38
    add-int/lit8 v8, v7, 0x1

    .line 39
    .line 40
    aget v6, v6, v8

    .line 41
    .line 42
    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    aget-object v6, p0, v0

    .line 47
    .line 48
    aget v6, v6, v7

    .line 49
    .line 50
    invoke-static {v6, v1}, Ljava/lang/Math;->max(FF)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    aget-object v6, p0, v0

    .line 55
    .line 56
    aget v6, v6, v8

    .line 57
    .line 58
    invoke-static {v6, v2}, Ljava/lang/Math;->max(FF)F

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/lit8 v5, v5, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_0
    aget-object v5, p1, v0

    .line 66
    .line 67
    invoke-virtual {v5, v3, v4, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    return-object p1
.end method

.method public getFaceLocalTriangulation([F[I)[[F
    .locals 24

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 261
    array-length v2, v1

    mul-int/lit8 v2, v2, 0x6

    const/4 v3, 0x2

    new-array v4, v3, [I

    const/4 v5, 0x1

    aput v2, v4, v5

    const/4 v2, 0x0

    aput v3, v4, v2

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[F

    .line 262
    array-length v6, v1

    mul-int/lit8 v6, v6, 0x6

    new-array v6, v6, [F

    .line 263
    array-length v7, v1

    mul-int/lit8 v7, v7, 0x6

    new-array v7, v7, [F

    .line 264
    array-length v8, v0

    div-int/2addr v8, v3

    move v9, v2

    .line 265
    :goto_0
    array-length v10, v1

    if-ge v9, v10, :cond_0

    .line 266
    aget v10, v1, v9

    .line 267
    sget-object v11, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    mul-int/lit8 v10, v10, 0x3

    aget v12, v11, v10

    add-int/lit8 v13, v10, 0x1

    .line 268
    aget v13, v11, v13

    add-int/2addr v10, v3

    .line 269
    aget v10, v11, v10

    .line 270
    aget v11, v0, v12

    add-int/2addr v12, v8

    .line 271
    aget v12, v0, v12

    .line 272
    aget v14, v0, v13

    add-int/2addr v13, v8

    .line 273
    aget v13, v0, v13

    .line 274
    aget v15, v0, v10

    add-int/2addr v10, v8

    .line 275
    aget v10, v0, v10

    mul-int/lit8 v16, v9, 0x6

    .line 276
    aput v11, v7, v16

    add-int/lit8 v17, v16, 0x1

    const/high16 v18, 0x3f800000    # 1.0f

    sub-float v19, v18, v12

    .line 277
    aput v19, v7, v17

    add-int/lit8 v19, v16, 0x2

    .line 278
    aput v14, v7, v19

    add-int/lit8 v20, v16, 0x3

    sub-float v21, v18, v13

    .line 279
    aput v21, v7, v20

    add-int/lit8 v21, v16, 0x4

    .line 280
    aput v15, v7, v21

    add-int/lit8 v22, v16, 0x5

    sub-float v23, v18, v10

    .line 281
    aput v23, v7, v22

    const/high16 v23, 0x40000000    # 2.0f

    mul-float v11, v11, v23

    sub-float v11, v11, v18

    .line 282
    aput v11, v6, v16

    mul-float v12, v12, v23

    sub-float v12, v12, v18

    neg-float v11, v12

    .line 283
    aput v11, v6, v17

    mul-float v14, v14, v23

    sub-float v14, v14, v18

    .line 284
    aput v14, v6, v19

    mul-float v13, v13, v23

    sub-float v13, v13, v18

    neg-float v11, v13

    .line 285
    aput v11, v6, v20

    mul-float v15, v15, v23

    sub-float v15, v15, v18

    .line 286
    aput v15, v6, v21

    mul-float v10, v10, v23

    sub-float v10, v10, v18

    neg-float v10, v10

    .line 287
    aput v10, v6, v22

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 288
    :cond_0
    aput-object v6, v4, v2

    .line 289
    aput-object v7, v4, v5

    return-object v4
.end method

.method public getFaceTriangulationBoundingBox([[F)[[F
    .locals 16

    move-object/from16 v0, p1

    const/4 v1, 0x2

    .line 175
    new-array v2, v1, [I

    const/4 v3, 0x1

    const/16 v4, 0x8

    aput v4, v2, v3

    const/4 v5, 0x0

    aput v1, v2, v5

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[F

    .line 176
    array-length v6, v0

    div-int/2addr v6, v1

    .line 177
    array-length v7, v0

    if-eqz v7, :cond_2

    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v8, -0x40800000    # -1.0f

    move v10, v5

    move v11, v7

    move v12, v11

    move v9, v8

    .line 178
    :goto_0
    array-length v13, v0

    if-ge v10, v13, :cond_1

    .line 179
    aget-object v13, v0, v10

    move v14, v5

    .line 180
    :goto_1
    array-length v15, v13

    div-int/2addr v15, v1

    if-ge v14, v15, :cond_0

    .line 181
    aget v15, v13, v10

    invoke-static {v15, v11}, Ljava/lang/Math;->min(FF)F

    move-result v11

    add-int v15, v10, v6

    move/from16 p0, v1

    .line 182
    aget v1, v13, v15

    invoke-static {v1, v12}, Ljava/lang/Math;->min(FF)F

    move-result v12

    .line 183
    aget v1, v13, v10

    invoke-static {v1, v9}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 184
    aget v1, v13, v15

    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    add-int/lit8 v14, v14, 0x1

    move/from16 v1, p0

    goto :goto_1

    :cond_0
    move/from16 p0, v1

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_1
    move/from16 p0, v1

    sub-float v0, v7, v12

    sub-float v1, v7, v8

    .line 185
    new-array v6, v4, [F

    aput v11, v6, v5

    aput v0, v6, v3

    aput v11, v6, p0

    const/4 v10, 0x3

    aput v1, v6, v10

    const/4 v13, 0x4

    aput v9, v6, v13

    const/4 v14, 0x5

    aput v0, v6, v14

    const/4 v0, 0x6

    aput v9, v6, v0

    const/4 v15, 0x7

    aput v1, v6, v15

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v11, v1

    sub-float/2addr v11, v7

    mul-float/2addr v12, v1

    sub-float/2addr v12, v7

    neg-float v12, v12

    mul-float/2addr v8, v1

    sub-float/2addr v8, v7

    neg-float v8, v8

    mul-float/2addr v9, v1

    sub-float/2addr v9, v7

    .line 186
    new-array v1, v4, [F

    aput v11, v1, v5

    aput v12, v1, v3

    aput v11, v1, p0

    aput v8, v1, v10

    aput v9, v1, v13

    aput v12, v1, v14

    aput v9, v1, v0

    aput v8, v1, v15

    .line 187
    aput-object v1, v2, v5

    .line 188
    aput-object v6, v2, v3

    return-object v2

    .line 189
    :cond_2
    const-string v0, "104\u70b9\u4e3a\u7a7a"

    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public landMark104ToPoint([FII)[F
    .locals 5

    .line 1
    array-length p0, p1

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    div-int/lit8 v2, v0, 0x2

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget v3, p1, v1

    .line 11
    .line 12
    int-to-float v4, p2

    .line 13
    div-float/2addr v3, v4

    .line 14
    aput v3, p0, v1

    .line 15
    .line 16
    add-int/2addr v2, v1

    .line 17
    aget v3, p1, v2

    .line 18
    .line 19
    int-to-float v4, p3

    .line 20
    div-float/2addr v3, v4

    .line 21
    aput v3, p0, v2

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-object p0
.end method

.method public sampleTextureCoordinatesBetweenVertexIndices([I[F)[F
    .locals 10

    .line 1
    array-length p0, p1

    .line 2
    div-int/lit8 p0, p0, 0x2

    .line 3
    .line 4
    array-length v0, p2

    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    mul-int/lit8 v1, p0, 0x2

    .line 8
    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, p0, :cond_0

    .line 13
    .line 14
    mul-int/lit8 v3, v2, 0x2

    .line 15
    .line 16
    aget v4, p1, v3

    .line 17
    .line 18
    add-int/lit8 v5, v3, 0x1

    .line 19
    .line 20
    aget v6, p1, v5

    .line 21
    .line 22
    new-instance v7, Landroid/graphics/PointF;

    .line 23
    .line 24
    aget v8, p2, v4

    .line 25
    .line 26
    add-int/2addr v4, v0

    .line 27
    aget v4, p2, v4

    .line 28
    .line 29
    invoke-direct {v7, v8, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 30
    .line 31
    .line 32
    new-instance v4, Landroid/graphics/PointF;

    .line 33
    .line 34
    aget v8, p2, v6

    .line 35
    .line 36
    add-int/2addr v6, v0

    .line 37
    aget v6, p2, v6

    .line 38
    .line 39
    invoke-direct {v4, v8, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 40
    .line 41
    .line 42
    new-instance v6, Landroid/graphics/PointF;

    .line 43
    .line 44
    iget v8, v7, Landroid/graphics/PointF;->x:F

    .line 45
    .line 46
    iget v9, v4, Landroid/graphics/PointF;->x:F

    .line 47
    .line 48
    add-float/2addr v8, v9

    .line 49
    const/high16 v9, 0x3f000000    # 0.5f

    .line 50
    .line 51
    mul-float/2addr v8, v9

    .line 52
    iget v7, v7, Landroid/graphics/PointF;->y:F

    .line 53
    .line 54
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 55
    .line 56
    add-float/2addr v7, v4

    .line 57
    mul-float/2addr v7, v9

    .line 58
    invoke-direct {v6, v8, v7}, Landroid/graphics/PointF;-><init>(FF)V

    .line 59
    .line 60
    .line 61
    iget v4, v6, Landroid/graphics/PointF;->x:F

    .line 62
    .line 63
    aput v4, v1, v3

    .line 64
    .line 65
    const/high16 v3, 0x3f800000    # 1.0f

    .line 66
    .line 67
    iget v4, v6, Landroid/graphics/PointF;->y:F

    .line 68
    .line 69
    sub-float/2addr v3, v4

    .line 70
    aput v3, v1, v5

    .line 71
    .line 72
    add-int/lit8 v2, v2, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    return-object v1
.end method
