.class public final synthetic Luu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Luu1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte p0, p0, Luu1;->a:B

    const/4 v0, 0x1

    sget-object v1, Lu55;->Ro:Lulp;

    packed-switch p0, :pswitch_data_da

    return-object v1

    :pswitch_9
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Lscd;->w(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_12
    new-instance p0, Lqth;

    invoke-direct {p0}, Lqth;-><init>()V

    return-object p0

    :pswitch_18
    new-instance p0, Li52;

    invoke-direct {p0}, Li52;-><init>()V

    return-object p0

    :pswitch_1e
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object p0, Ls9g;->h:Ls9g;

    return-object p0

    :pswitch_23
    const-string p0, "http(s)?://([\\d\\w]+\\.)*booking\\.[\\d\\w]+(/[\\w\\d-]+)*/(?i)confirmation(?-i)(.+)*"

    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p0

    return-object p0

    :pswitch_2a
    invoke-static {}, Lsgb;->f()La64;

    move-result-object p0

    return-object p0

    :pswitch_2f
    new-instance p0, Lvvg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-byte v0, p0, Lvvg;->a:B

    return-object p0

    :pswitch_38
    new-instance p0, Lm6l;

    invoke-direct {p0}, Lm6l;-><init>()V

    return-object p0

    :pswitch_3e
    new-instance p0, Lqwe;

    invoke-direct {p0}, Lqwe;-><init>()V

    return-object p0

    :pswitch_44
    new-instance p0, Ldjg;

    invoke-direct {p0}, Ldjg;-><init>()V

    return-object p0

    :pswitch_4a
    new-instance p0, Lr9c;

    invoke-direct {p0}, Lr9c;-><init>()V

    return-object p0

    :pswitch_50
    new-instance p0, Lcom/opera/android/history/HistoryManager;

    invoke-direct {p0}, Lcom/opera/android/history/HistoryManager;-><init>()V

    return-object p0

    :pswitch_56
    new-instance p0, Lzwk;

    invoke-direct {p0}, Lzwk;-><init>()V

    return-object p0

    :pswitch_5c
    new-instance p0, Ltm5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, p0, Ltm5;->b:Z

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ltm5;->d:Ljava/util/HashSet;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Ltm5;->e:Ljava/util/Set;

    return-object p0

    :pswitch_76
    new-instance p0, Lech;

    invoke-direct {p0}, Lech;-><init>()V

    return-object p0

    :pswitch_7c
    new-instance p0, Ltv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_82
    return-object v1

    :pswitch_83
    new-instance p0, Ljava/io/File;

    sget-object v0, Lsnf;->d:Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_8b
    sget-object p0, Lvml;->d:Lumi;

    return-object p0

    :pswitch_8e
    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_93
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_9a
    invoke-static {}, Li0l;->g()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_a3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Lscd;->w(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_ac
    sget-object p0, Lyne;->b:Ldeg;

    return-object p0

    :pswitch_af
    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_b4
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_b7
    invoke-static {}, Li0l;->g()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_c0
    sget-object p0, Lcak;->d:Lavj;

    invoke-static {v0}, Lavj;->b(I)Z

    move-result p0

    if-eqz p0, :cond_cd

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object p0

    goto :goto_cf

    :cond_cd
    const-string p0, ""

    :goto_cf
    return-object p0

    :pswitch_d0
    invoke-static {}, Li0l;->g()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_da
    .packed-switch 0x0
        :pswitch_d0
        :pswitch_c0
        :pswitch_b7
        :pswitch_b4
        :pswitch_af
        :pswitch_ac
        :pswitch_a3
        :pswitch_9a
        :pswitch_93
        :pswitch_8e
        :pswitch_8b
        :pswitch_83
        :pswitch_82
        :pswitch_7c
        :pswitch_76
        :pswitch_5c
        :pswitch_56
        :pswitch_50
        :pswitch_4a
        :pswitch_44
        :pswitch_3e
        :pswitch_38
        :pswitch_2f
        :pswitch_2a
        :pswitch_23
        :pswitch_1e
        :pswitch_18
        :pswitch_12
        :pswitch_9
    .end packed-switch
.end method
