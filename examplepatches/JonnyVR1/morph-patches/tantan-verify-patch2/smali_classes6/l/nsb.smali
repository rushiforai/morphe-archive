.class public Ll/nsb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/nsb;",
            ">;"
        }
    .end annotation
.end field

.field public static e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    const/16 v0, 0x122

    .line 1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xfc

    .line 2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x17d

    .line 3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x2f

    .line 4
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v8, 0x165

    .line 5
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/16 v10, 0x24e

    .line 6
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v12, 0xd4

    .line 7
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x7

    .line 8
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v2, 0x3e3

    .line 9
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v16, 0x2c

    .line 10
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 11
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    sput-object v17, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 12
    new-instance v17, Ljava/util/HashMap;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashMap;-><init>()V

    sput-object v17, Ll/nsb;->e:Ljava/util/HashMap;

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    move-result-object v6

    const-string v12, "ttt_open_86_login"

    invoke-virtual {v6, v12}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v12, "false"

    invoke-static {v6, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    .line 14
    sget-object v12, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v14, 0x5d

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v2, "AF"

    invoke-virtual {v12, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x163

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AL"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0xd5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "DZ"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0x178

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AD"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0xf4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AO"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0x4f4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AG"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0x36

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AR"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0x176

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AM"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0x3d

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v8, "AU"

    invoke-virtual {v2, v8, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v18, 0x2b

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v10, "AT"

    invoke-virtual {v2, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v8, 0x3e2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v8, "AZ"

    invoke-virtual {v2, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v19, 0x4da

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "BS"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x3cd

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BH"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x370

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BD"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x4de

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BB"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x177

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BY"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x20

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BE"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x1f5

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BZ"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0xe5

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BJ"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x3cf

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BT"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x24f

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BO"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x183

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BA"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x10b

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BW"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x37

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "BR"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x2a1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "BN"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x167

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "BG"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0xe2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "BF"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x101

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "BI"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x357

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "KH"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0xed

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v14, "CM"

    invoke-virtual {v2, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v10, "CA"

    invoke-virtual {v2, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0xee

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move/from16 v20, v6

    const-string v6, "CV"

    invoke-virtual {v2, v6, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0xec

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CF"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0xeb

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "TD"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0x38

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CL"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v20, :cond_0

    .line 49
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0x56

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CN"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_0
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0x39

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CO"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v6, "KM"

    const/16 v10, 0x10d

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v6, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0xf3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CD"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0xf2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CG"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0x1fa

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CR"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v6, "CI"

    const/16 v10, 0xe1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v6, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0x181

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "HR"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v6, 0x35

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v10, "CU"

    invoke-virtual {v2, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v6, "CY"

    invoke-virtual {v2, v6, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x1a4

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object/from16 v21, v1

    const-string v1, "CZ"

    invoke-virtual {v2, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x2d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "DK"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0xfd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "DJ"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x6e7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "DM"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x711

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "DO"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x251

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "EC"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "EG"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x1f7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "SV"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0xf0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "GQ"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x123

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "ER"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x174

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "EE"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0xfb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "ET"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x2a7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "FJ"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x166

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "FI"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x21

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "FR"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0xf1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "GA"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0xdc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v10, "GM"

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v2, "GE"

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v10, 0x31

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object/from16 v22, v9

    const-string v9, "DE"

    invoke-virtual {v1, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GH"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1e

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x5c1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GD"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1f6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xf5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x250

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "GY"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1fd

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "HT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1f8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "HN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x24

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "HU"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x162

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IS"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x5b

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3e

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ID"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x62

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IQ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x161

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3cc

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IL"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x27

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "IT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x754

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "JM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x51

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "JP"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "JO"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "KZ"

    invoke-virtual {v1, v9, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xfe

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2ae

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KI"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x352

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KP"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x52

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3e4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x358

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x173

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LV"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LB"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x10a

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LS"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xda

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LY"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1a7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LI"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x172

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x160

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LU"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x185

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MK"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x105

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x109

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MY"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MV"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xdf

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ML"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x164

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2b4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MH"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xde

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MU"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x34

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MX"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2b3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "FM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x175

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MD"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x179

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MC"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3d0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x17e

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ME"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "MA"

    invoke-virtual {v1, v9, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x102

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MZ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x5f

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "MM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x108

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2a2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3d1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NP"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1f

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NL"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x40

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NZ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1f9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NI"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xea

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "NG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "NO"

    invoke-virtual {v1, v9, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "OM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x5c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PK"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2a8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1fb

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2a3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x253

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PY"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x33

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3f

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PH"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x30

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PL"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x15f

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "PT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3ce

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "QA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x28

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "RO"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "RU"

    invoke-virtual {v1, v9, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xfa

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "RW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x74d

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "KN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x6de

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LC"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x6f8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "VC"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2ad

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "WS"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x17a

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xef

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ST"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xdd

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "RS"

    invoke-virtual {v1, v9, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xf8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SC"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SL"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x41

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1a5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SK"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x182

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SI"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2a5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SB"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "SO"

    invoke-virtual {v1, v9, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x1b

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ZA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x22

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ES"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x5e

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "LK"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xf9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SD"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x255

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x10c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SZ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2e

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x29

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "CH"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "SY"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3e0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TJ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xff

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TZ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x42

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TH"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x29e

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TL"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xe4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2a4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TO"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x74c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TT"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0xd8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x5a

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TR"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3e1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2b0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TV"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x100

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "UG"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x17c

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "UA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3cb

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "AE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "GB"

    invoke-virtual {v1, v9, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v9, "US"

    invoke-virtual {v1, v9, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x256

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "UY"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3e6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "UZ"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x2a6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "VU"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x17b

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "VA"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3a

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "VE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x54

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "VN"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x3c7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "YE"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x104

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ZM"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x107

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ZW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v9, 0x376

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "TW"

    invoke-virtual {v1, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const v9, 0x9279

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const v8, 0x16118

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v1, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const v8, 0x5b31d

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "MD"

    invoke-virtual {v1, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v8, "SO"

    invoke-virtual {v1, v8, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v2, "CX"

    invoke-virtual {v1, v2, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v2, "CC"

    invoke-virtual {v1, v2, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x2a0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NF"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x2af

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "NC"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x2b1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "PF"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v2, 0x106

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "YT"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v2, "GP"

    invoke-virtual {v1, v2, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v3, 0x1fc

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "PM"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v3, 0x2a9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "WF"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v3, 0x2aa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "CK"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v3, 0x2ab

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "NU"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v3, 0x2b2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "TK"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v3, "GG"

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v3, "IM"

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget-object v1, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v3, "JE"

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x4f0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "AI"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x5a1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "BM"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0xf6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "IO"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    move-object/from16 v1, v22

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x504

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "VG"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x541

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "KY"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "FK"

    const/16 v3, 0x1f4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x15e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "GI"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x680

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "MS"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "SH"

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x671

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "TC"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x686

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "MP"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x6fb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "PR"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x694

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "AS"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x687

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "GU"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x53c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "VI"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x354

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "HK"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x355

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "MO"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x12a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "FO"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x12b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "GL"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x252

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "GF"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    invoke-virtual {v0, v2, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "MQ"

    const/16 v2, 0x254

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x106

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "RE"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const v1, 0x8bea

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AX"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x129

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AW"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x257

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AN"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "SJ"

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0xf7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AC"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "TA"

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "CS"

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const/16 v1, 0x3ca

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "PS"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    sget-object v0, Ll/nsb;->e:Ljava/util/HashMap;

    const-string v1, "EH"

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->d:I

    const-string v3, "afghanistan"

    const/16 v4, 0x5d

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->e:I

    const-string v3, "albania"

    const/16 v4, 0x163

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->f:I

    const-string v3, "algeria"

    const/16 v4, 0xd5

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->g:I

    const/16 v3, 0x694

    const-string v4, "american-samoa"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->h:I

    const-string v3, "andorra"

    const/16 v4, 0x178

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->i:I

    const-string v3, "angola"

    const/16 v4, 0xf4

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->j:I

    const/16 v3, 0x4f0

    const-string v4, "anguilla"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->k:I

    const/16 v3, 0x2a0

    const-string v4, "antarctica"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 271
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->l:I

    const-string v3, "antigua-and-barbuda"

    const/16 v4, 0x4f4

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->m:I

    const-string v3, "argentina"

    const/16 v4, 0x36

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 273
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->n:I

    const-string v3, "armenia"

    const/16 v4, 0x176

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->o:I

    const/16 v3, 0x129

    const-string v4, "aruba"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->p:I

    const-string v3, "australia"

    const/16 v4, 0x3d

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 276
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->q:I

    const-string v3, "austria"

    move/from16 v4, v18

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->r:I

    const-string v3, "azerbaijan"

    const/16 v4, 0x3e2

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->s:I

    const-string v3, "bahamas"

    move/from16 v4, v19

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->t:I

    const-string v3, "bahrain"

    const/16 v4, 0x3cd

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->u:I

    const-string v3, "bangladesh"

    const/16 v4, 0x370

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 281
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->v:I

    const-string v3, "barbados"

    const/16 v4, 0x4de

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->w:I

    const-string v3, "belarus"

    const/16 v4, 0x177

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 283
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->x:I

    const-string v3, "belgium"

    const/16 v4, 0x20

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 284
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->y:I

    const-string v3, "belize"

    const/16 v4, 0x1f5

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->z:I

    const-string v3, "benin"

    const/16 v4, 0xe5

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->A:I

    const/16 v3, 0x5a1

    const-string v4, "bermuda"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->B:I

    const-string v3, "bhutan"

    const/16 v4, 0x3cf

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->C:I

    const-string v3, "bolivia"

    const/16 v4, 0x24f

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->D:I

    const-string v3, "bosnia-and-herzegovina"

    const/16 v4, 0x183

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 290
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->E:I

    const-string v3, "botswana"

    const/16 v4, 0x10b

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 291
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->F:I

    const-string v3, "brazil"

    const/16 v4, 0x37

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->G:I

    const/16 v3, 0x504

    const-string v4, "british-virgin-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->H:I

    const/16 v3, 0x2a1

    const-string v4, "brunei"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 294
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->I:I

    const/16 v3, 0x167

    const-string v4, "bulgaria"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->J:I

    const/16 v3, 0xe2

    const-string v4, "burkina-faso"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->K:I

    const/16 v3, 0x101

    const-string v4, "burundi"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->L:I

    const/16 v3, 0x357

    const-string v4, "cambodia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->M:I

    const/16 v3, 0xed

    const-string v4, "cameroon"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 299
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->N:I

    const-string v3, "canada"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 300
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->O:I

    const/16 v3, 0xee

    const-string v4, "cape-verde"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 301
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->P:I

    const/16 v3, 0x541

    const-string v4, "cayman-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 302
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Q:I

    const/16 v3, 0xec

    const-string v4, "central-african-republic"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 303
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->R:I

    const/16 v3, 0xeb

    const-string v4, "chad"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 304
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->S:I

    const/16 v3, 0x38

    const-string v4, "chile"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-nez v20, :cond_1

    .line 305
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->T:I

    const/16 v3, 0x56

    const-string v4, "china"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 306
    :cond_1
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->X:I

    const-string v3, "christmas-island"

    const/16 v4, 0x3d

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 307
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Y:I

    const-string v3, "cocos-keeling-islands"

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 308
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Z:I

    const/16 v3, 0x39

    const-string v4, "colombia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 309
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->a0:I

    const-string v3, "comoros"

    const/16 v4, 0x10d

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->b0:I

    const/16 v3, 0xf2

    const-string v4, "congo"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->c0:I

    const/16 v3, 0xf3

    const-string v4, "congo-drc"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 312
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->d0:I

    const/16 v3, 0x2aa

    const-string v4, "cook-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->e0:I

    const/16 v3, 0x1fa

    const-string v4, "costa-rica"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 314
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->f0:I

    const-string v3, "cote-divoire"

    const/16 v4, 0xe1

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 315
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->g0:I

    const/16 v3, 0x181

    const-string v4, "croatia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 316
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->h0:I

    const/16 v3, 0x35

    const-string v4, "cuba"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 317
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->i0:I

    const-string v3, "cyprus"

    const/16 v4, 0x165

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 318
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->j0:I

    const/16 v3, 0x1a4

    const-string v4, "czech-republic"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->k0:I

    const/16 v3, 0x2d

    const-string v4, "denmark"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 320
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->l0:I

    const/16 v3, 0xfd

    const-string v4, "djibouti"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 321
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->m0:I

    const/16 v3, 0x6e7

    const-string v4, "dominica"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->n0:I

    const/16 v3, 0x711

    const-string v4, "dominican-republic"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->o0:I

    const/16 v3, 0x251

    const-string v4, "ecuador"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->p0:I

    const/16 v3, 0x14

    const-string v4, "egypt"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 325
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->q0:I

    const/16 v3, 0x1f7

    const-string v4, "el-salvador"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 326
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->r0:I

    const/16 v3, 0xf0

    const-string v4, "equatorial-guinea"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 327
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->s0:I

    const/16 v3, 0x123

    const-string v4, "eritrea"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->t0:I

    const/16 v3, 0x174

    const-string v4, "estonia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 329
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->u0:I

    const/16 v3, 0xfb

    const-string v4, "ethiopia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->v0:I

    const-string v3, "falkland-islands"

    const/16 v4, 0x1f4

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 331
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->w0:I

    const/16 v3, 0x12a

    const-string v4, "faroe-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 332
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->x0:I

    const/16 v3, 0x2a7

    const-string v4, "fiji"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->y0:I

    const/16 v3, 0x166

    const-string v4, "finland"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->z0:I

    const/16 v3, 0x21

    const-string v4, "france"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->A0:I

    const/16 v3, 0x252

    const-string v4, "french-guiana"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->B0:I

    const/16 v3, 0x2b1

    const-string v4, "french-polynesia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 337
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->C0:I

    const-string v3, "french-southern-and-antarctic-lands"

    const/16 v4, 0x254

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 338
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->D0:I

    const/16 v3, 0xf1

    const-string v4, "gabon"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 339
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->E0:I

    const/16 v3, 0xdc

    const-string v4, "gambia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->F0:I

    const-string v3, "georgia"

    const/16 v4, 0x3e3

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 341
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->G0:I

    const/16 v3, 0x31

    const-string v4, "germany"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 342
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->H0:I

    const/16 v3, 0xe9

    const-string v4, "ghana"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->I0:I

    const/16 v3, 0x15e

    const-string v4, "gibraltar"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 344
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->J0:I

    const/16 v3, 0x1e

    const-string v4, "greece"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 345
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->K0:I

    const/16 v3, 0x12b

    const-string v4, "greenland"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->L0:I

    const/16 v3, 0x5c1

    const-string v4, "grenada"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 347
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->M0:I

    const-string v3, "guadeloupe"

    const/16 v4, 0x24e

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->N0:I

    const/16 v3, 0x687

    const-string v4, "guam"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 349
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->O0:I

    const/16 v3, 0x1f6

    const-string v4, "guatemala"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 350
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->P0:I

    const/16 v3, 0xe0

    const-string v4, "guinea"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Q0:I

    const-string v3, "guinea-bissau"

    const/16 v4, 0xe1

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 352
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->R0:I

    const/16 v3, 0x250

    const-string v4, "guyana"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 353
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->S0:I

    const/16 v3, 0x1fd

    const-string v4, "haiti"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 354
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->T0:I

    const/16 v3, 0x17b

    const-string v4, "holy-see-vatican-city"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 355
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->U0:I

    const/16 v3, 0x1f8

    const-string v4, "honduras"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 356
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->U:I

    const/16 v3, 0x354

    const-string v4, "hong-kong"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 357
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->V0:I

    const/16 v3, 0x24

    const-string v4, "hungary"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 358
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->W0:I

    const/16 v3, 0x162

    const-string v4, "iceland"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 359
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->X0:I

    const/16 v3, 0x5b

    const-string v4, "india"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Y0:I

    const/16 v3, 0x3e

    const-string v4, "indonesia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 361
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Z0:I

    const/16 v3, 0x62

    const-string v4, "iran"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 362
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->a1:I

    const/16 v3, 0x3c4

    const-string v4, "iraq"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->b1:I

    const/16 v3, 0x161

    const-string v4, "ireland"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->c1:I

    const/16 v3, 0x3cc

    const-string v4, "israel"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 365
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->d1:I

    const/16 v3, 0x27

    const-string v4, "italy"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 366
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->e1:I

    const/16 v3, 0x754

    const-string v4, "jamaica"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 367
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->f1:I

    const/16 v3, 0x51

    const-string v4, "japan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 368
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->g1:I

    const/16 v3, 0x3c2

    const-string v4, "jordan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 369
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->h1:I

    const-string v3, "kazakhstan"

    const/4 v4, 0x7

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 370
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->i1:I

    const/16 v3, 0xfe

    const-string v4, "kenya"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->j1:I

    const/16 v3, 0x2ae

    const-string v4, "kiribati"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Q2:I

    const/16 v3, 0x52

    const-string v4, "south-korea"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 373
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->k1:I

    const/16 v3, 0x3c5

    const-string v4, "kuwait"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->l1:I

    const/16 v3, 0x3e4

    const-string v4, "kyrgyzstan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 375
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->m1:I

    const/16 v3, 0x358

    const-string v4, "laos"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 376
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->n1:I

    const/16 v3, 0x173

    const-string v4, "latvia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->o1:I

    const/16 v3, 0x3c1

    const-string v4, "lebanon"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 378
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->p1:I

    const/16 v3, 0x10a

    const-string v4, "lesotho"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->q1:I

    const/16 v3, 0xe7

    const-string v4, "liberia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->r1:I

    const/16 v3, 0xda

    const-string v4, "libya"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 381
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->s1:I

    const/16 v3, 0x1a7

    const-string v4, "liechtenstein"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 382
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->t1:I

    const/16 v3, 0x172

    const-string v4, "lithuania"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 383
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->u1:I

    const/16 v3, 0x160

    const-string v4, "luxembourg"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->V:I

    const/16 v3, 0x355

    const-string v4, "macau"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->v1:I

    const/16 v3, 0x185

    const-string v4, "macedonia-fyro"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->w1:I

    const/16 v3, 0x105

    const-string v4, "madagascar"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->x1:I

    const/16 v3, 0x109

    const-string v4, "malawi"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->y1:I

    const/16 v3, 0x3c

    const-string v4, "malaysia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 389
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->z1:I

    const/16 v3, 0x3c0

    const-string v4, "maldives"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 390
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->A1:I

    const/16 v3, 0xdf

    const-string v4, "mali"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 391
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->B1:I

    const/16 v3, 0x164

    const-string v4, "malta"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->C1:I

    const/16 v3, 0x2b4

    const-string v4, "marshall-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->D1:I

    const-string v3, "martinique"

    const/16 v4, 0x254

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 394
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->E1:I

    const/16 v3, 0xde

    const-string v4, "mauritania"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 395
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->F1:I

    const/16 v3, 0xe6

    const-string v4, "mauritius"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 396
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->G1:I

    const-string v3, "mayotte"

    const/16 v4, 0x10d

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->H1:I

    const/16 v3, 0x34

    const-string v4, "mexico"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 398
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->I1:I

    const/16 v3, 0x2b3

    const-string v4, "micronesia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 399
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->J1:I

    const/16 v3, 0x175

    const-string v4, "moldova"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->K1:I

    const/16 v3, 0x179

    const-string v4, "monaco"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 401
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->L1:I

    const/16 v3, 0x3d0

    const-string v4, "mongolia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 402
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->M1:I

    const/16 v3, 0x17e

    const-string v4, "montenegro"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 403
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->N1:I

    const/16 v3, 0x680

    const-string v4, "montserrat"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->O1:I

    const-string v3, "morocco"

    const/16 v4, 0xd4

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 405
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->P1:I

    const/16 v3, 0x102

    const-string v4, "mozambique"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 406
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Q1:I

    const/16 v3, 0x5f

    const-string v4, "myanmar"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 407
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->R1:I

    const/16 v3, 0x108

    const-string v4, "namibia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 408
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->S1:I

    const/16 v3, 0x2a2

    const-string v4, "nauru"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 409
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->T1:I

    const/16 v3, 0x3d1

    const-string v4, "nepal"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 410
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->U1:I

    const/16 v3, 0x1f

    const-string v4, "netherlands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 411
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->V1:I

    const/16 v3, 0x257

    const-string v4, "netherlands-antilles"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->W1:I

    const/16 v3, 0x2af

    const-string v4, "new-caledonia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 413
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->X1:I

    const/16 v3, 0x40

    const-string v4, "new-zealand"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Y1:I

    const/16 v3, 0x1f9

    const-string v4, "nicaragua"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 415
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Z1:I

    const/16 v3, 0xe3

    const-string v4, "niger"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 416
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->a2:I

    const/16 v3, 0xea

    const-string v4, "nigeria"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->b2:I

    const/16 v3, 0x2ab

    const-string v4, "niue"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->c2:I

    const/16 v3, 0x1a43

    const-string v4, "norfolk-island"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 419
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->e2:I

    const/16 v3, 0x352

    const-string v4, "north-korea"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 420
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->d2:I

    const/16 v3, 0x686

    const-string v4, "northern-mariana-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 421
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->f2:I

    const-string v3, "norway"

    const/16 v4, 0x2f

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->g2:I

    const/16 v3, 0x3c8

    const-string v4, "oman"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 423
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->h2:I

    const/16 v3, 0x5c

    const-string v4, "pakistan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->i2:I

    const/16 v3, 0x2a8

    const-string v4, "palau"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 425
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->j2:I

    const/16 v3, 0x3ca

    const-string v4, "palestine"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 426
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->k2:I

    const/16 v3, 0x1fb

    const-string v4, "panama"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 427
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->l2:I

    const/16 v3, 0x2a3

    const-string v4, "papua-new-guinea"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 428
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->m2:I

    const/16 v3, 0x253

    const-string v4, "paraguay"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 429
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->n2:I

    const/16 v3, 0x33

    const-string v4, "peru"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 430
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->o2:I

    const/16 v3, 0x3f

    const-string v4, "philippines"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 431
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->p2:I

    const/16 v3, 0x368

    const-string v4, "pitcairn-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 432
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->q2:I

    const/16 v3, 0x30

    const-string v4, "poland"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 433
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->r2:I

    const/16 v3, 0x15f

    const-string v4, "portugal"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->s2:I

    const/16 v3, 0x6fb

    const-string v4, "puerto-rico"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 435
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->t2:I

    const/16 v3, 0x3ce

    const-string v4, "qatar"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 436
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->u2:I

    const/16 v3, 0x28

    const-string v4, "romania"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 437
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->v2:I

    const-string v3, "russia"

    const/4 v4, 0x7

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 438
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->w2:I

    const/16 v3, 0xfa

    const-string v4, "rwanda"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->x2:I

    const-string v3, "saint-helena-ascension-and-tristan-da-cunha"

    const/16 v4, 0x122

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 440
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->y2:I

    const/16 v3, 0x74d

    const-string v4, "saint-kitts-and-nevis"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 441
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->z2:I

    const/16 v3, 0x6de

    const-string v4, "saint-lucia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->A2:I

    const/16 v3, 0x6f8

    const-string v4, "saint-vincent-and-the-grenadines"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 443
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->B2:I

    const/16 v3, 0x2ad

    const-string v4, "samoa"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->C2:I

    const/16 v3, 0x17a

    const-string v4, "san-marino"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 445
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->E2:I

    const/16 v3, 0x3c6

    const-string v4, "saudi-arabia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 446
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->D2:I

    const/16 v3, 0xef

    const-string v4, "sao-tome-and-principe"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 447
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->F2:I

    const/16 v3, 0xdd

    const-string v4, "senegal"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 448
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->G2:I

    const-string v3, "serbia"

    const/16 v4, 0x17d

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 449
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->H2:I

    const/16 v3, 0xf8

    const-string v4, "seychelles"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 450
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->I2:I

    const/16 v3, 0xe8

    const-string v4, "sierra-leone"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->J2:I

    const/16 v3, 0x41

    const-string v4, "singapore"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 452
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->K2:I

    const/16 v3, 0x1a5

    const-string v4, "slovakia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 453
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->L2:I

    const/16 v3, 0x182

    const-string v4, "slovenia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 454
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->M2:I

    const/16 v3, 0x2a5

    const-string v4, "solomon-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->N2:I

    const-string v3, "somalia"

    const/16 v4, 0xfc

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 456
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->O2:I

    const/16 v3, 0x1b

    const-string v4, "south-africa"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 457
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->P2:I

    const-string v3, "south-georgia-and-the-south-sandwich-islands"

    const/16 v4, 0x1f4

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 458
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->R2:I

    const/16 v3, 0xd3

    const-string v4, "south-sudan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 459
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->S2:I

    const/16 v3, 0x22

    const-string v4, "spain"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 460
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->T2:I

    const/16 v3, 0x5e

    const-string v4, "sri-lanka"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 461
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->U2:I

    const/16 v3, 0xf9

    const-string v4, "sudan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 462
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->V2:I

    const/16 v3, 0x255

    const-string v4, "suriname"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 463
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->W2:I

    const/16 v3, 0x2e

    const-string v4, "sweden"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 464
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->X2:I

    const/16 v3, 0x29

    const-string v4, "switzerland"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 465
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Y2:I

    const/16 v3, 0x3c3

    const-string v4, "syria"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 466
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->W:I

    const/16 v3, 0x376

    const-string v4, "taiwan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->Z2:I

    const/16 v3, 0x3e0

    const-string v4, "tajikistan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 468
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->a3:I

    const/16 v3, 0xff

    const-string v4, "tanzania"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 469
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->b3:I

    const/16 v3, 0x42

    const-string v4, "thailand"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 470
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->c3:I

    const/16 v3, 0xe4

    const-string v4, "togo"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->d3:I

    const/16 v3, 0x2b2

    const-string v4, "tokelau"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 472
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->e3:I

    const/16 v3, 0x2a4

    const-string v4, "tonga"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 473
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->f3:I

    const/16 v3, 0x74c

    const-string v4, "trinidad-and-tobago"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 474
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->g3:I

    const/16 v3, 0xd8

    const-string v4, "tunisia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 475
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->h3:I

    const/16 v3, 0x5a

    const-string v4, "turkey"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 476
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->i3:I

    const/16 v3, 0x3e1

    const-string v4, "turkmenistan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 477
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->j3:I

    const/16 v3, 0x671

    const-string v4, "turks-and-caicos-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 478
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->k3:I

    const/16 v3, 0x2b0

    const-string v4, "tuvalu"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 479
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->l3:I

    const/16 v3, 0x100

    const-string v4, "uganda"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 480
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->m3:I

    const/16 v3, 0x17c

    const-string v4, "ukraine"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->n3:I

    const/16 v3, 0x3cb

    const-string v4, "united-arab-emirates"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 482
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->o3:I

    const-string v3, "united-kingdom"

    move/from16 v4, v16

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 483
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->p3:I

    const-string v3, "united-states"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 484
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->q3:I

    const/16 v3, 0x256

    const-string v4, "uruguay"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 485
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->r3:I

    const/16 v3, 0x53c

    const-string v4, "us-virgin-islands"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 486
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->s3:I

    const/16 v3, 0x3e6

    const-string v4, "uzbekistan"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 487
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->t3:I

    const/16 v3, 0x2a6

    const-string v4, "vanuatu"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 488
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->u3:I

    const/16 v3, 0x3a

    const-string v4, "venezuela"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 489
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->v3:I

    const/16 v3, 0x54

    const-string v4, "vietnam"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 490
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->w3:I

    const/16 v3, 0x2a9

    const-string v4, "wallis-and-futuna"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 491
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->x3:I

    const-string v3, "western-sahara"

    const/16 v4, 0xd4

    invoke-direct {v1, v2, v4, v3}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 492
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->y3:I

    const/16 v3, 0x3c7

    const-string v4, "yemen"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 493
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->z3:I

    const/16 v3, 0x104

    const-string v4, "zambia"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 494
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/nsb;

    sget v2, Lcom/p1/mobile/android/R$string;->A3:I

    const/16 v3, 0x107

    const-string v4, "zimbabwe"

    invoke-direct {v1, v2, v3, v4}, Ll/nsb;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 495
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v0

    const/4 v1, 0x0

    .line 496
    invoke-virtual {v0, v1}, Ljava/text/Collator;->setStrength(I)V

    .line 497
    sget-object v2, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v3, Ll/jsb;

    invoke-direct {v3, v0}, Ll/jsb;-><init>(Ljava/text/Collator;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 498
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    sget v2, Lcom/p1/mobile/android/R$string;->u8:I

    .line 499
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ll/ksb;

    invoke-direct {v2}, Ll/ksb;-><init>()V

    .line 500
    invoke-static {v0, v2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    move-result-object v0

    .line 501
    invoke-static {v0}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 502
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 503
    sget-object v3, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v4, Ll/lsb;

    invoke-direct {v4, v2}, Ll/lsb;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    move-result v2

    if-lez v2, :cond_2

    .line 504
    sget-object v3, Ll/nsb;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll/nsb;

    .line 505
    sget-object v4, Ll/nsb;->d:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 506
    sget-object v2, Ll/nsb;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 507
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    const-string v2, "phone"

    .line 508
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 509
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    goto :goto_1

    .line 510
    :cond_4
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    :goto_1
    if-nez v0, :cond_5

    const/4 v0, 0x0

    goto :goto_2

    .line 511
    :cond_5
    sget-object v2, Ll/nsb;->e:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    :goto_2
    if-eqz v0, :cond_6

    .line 512
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 513
    sget-object v2, Ll/nsb;->d:Ljava/util/ArrayList;

    new-instance v3, Ll/msb;

    invoke-direct {v3, v0}, Ll/msb;-><init>(I)V

    invoke-static {v2, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    move-result v0

    goto :goto_3

    :cond_6
    const/4 v0, -0x1

    :goto_3
    if-ltz v0, :cond_7

    .line 514
    sget-object v2, Ll/nsb;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/nsb;

    .line 515
    sget-object v3, Ll/nsb;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 516
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_7
    return-void

    :catchall_0
    move-exception v0

    .line 517
    new-instance v1, Ljava/lang/Throwable;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CountryCallingCode exception:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/nsb;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/nsb;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/nsb;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/text/Collator;Ll/nsb;Ll/nsb;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    iget p1, p1, Ll/nsb;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    iget p2, p2, Ll/nsb;->a:I

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static synthetic b(Ljava/lang/String;Ll/nsb;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/nsb;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(ILl/nsb;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/nsb;->b:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
