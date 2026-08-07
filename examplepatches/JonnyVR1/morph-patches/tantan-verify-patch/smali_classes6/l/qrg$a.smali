.class public final Ll/qrg$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qrg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/n570;

.field public c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public d:Landroid/view/ViewGroup;

.field public e:Ljava/lang/String;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/qrg$a;->d:Landroid/view/ViewGroup;

    .line 5
    .line 6
    iput-object p1, p0, Ll/qrg$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/qrg$a;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrg$a;->a:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/qrg$a;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrg$a;->d:Landroid/view/ViewGroup;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/qrg$a;)Ll/n570;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrg$a;->b:Ll/n570;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/qrg$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qrg$a;->f:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/qrg$a;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrg$a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/qrg$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrg$a;->e:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public g()Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/qrg;->b(Ll/qrg$a;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Z)Ll/qrg$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/qrg$a;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/qrg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qrg$a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/qrg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qrg$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ll/n570;)Ll/qrg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qrg$a;->b:Ll/n570;

    .line 2
    .line 3
    return-object p0
.end method
