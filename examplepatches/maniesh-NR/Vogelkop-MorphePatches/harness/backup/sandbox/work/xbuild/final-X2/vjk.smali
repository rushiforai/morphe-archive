.class public final Lvjk;
.super Luik;
.source "SourceFile"


# static fields
.field public static final i:Lbc6;


# instance fields
.field public b:B

.field public c:Z

.field public d:Lorg/chromium/gfx/mojom/Rect;

.field public e:Lorg/chromium/gfx/mojom/Rect;

.field public f:Lbhk;

.field public g:Lbhk;

.field public h:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x38

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lvjk;->i:Lbc6;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x38

    invoke-direct {p0, v0}, Luik;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 6

    sget-object v0, Lvjk;->i:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-byte v0, p0, Lvjk;->b:B

    const/16 v1, 0x8

    invoke-virtual {p1, v0, v1}, Lbp;->y(II)V

    iget-boolean v0, p0, Lvjk;->c:Z

    const/16 v1, 0xc

    invoke-virtual {p1, v0, v1}, Lbp;->y(II)V

    iget-object v0, p0, Lvjk;->d:Lorg/chromium/gfx/mojom/Rect;

    const/16 v1, 0x10

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lbp;->J(Luik;IZ)V

    iget-object v0, p0, Lvjk;->e:Lorg/chromium/gfx/mojom/Rect;

    const/16 v1, 0x18

    const/4 v3, 0x1

    invoke-virtual {p1, v0, v1, v3}, Lbp;->J(Luik;IZ)V

    iget-object v0, p0, Lvjk;->f:Lbhk;

    const/16 v1, 0x20

    invoke-virtual {p1, v0, v1, v2}, Lbp;->J(Luik;IZ)V

    iget-object v0, p0, Lvjk;->g:Lbhk;

    const/16 v1, 0x28

    invoke-virtual {p1, v0, v1, v3}, Lbp;->J(Luik;IZ)V

    iget-boolean p0, p0, Lvjk;->h:Z

    const/16 v0, 0x30

    invoke-virtual {p1, v0, v2, p0}, Lbp;->A(IIZ)V

    return-void
.end method
