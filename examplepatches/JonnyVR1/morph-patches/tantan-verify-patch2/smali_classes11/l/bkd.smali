.class public final synthetic Ll/bkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Ll/hk0$a;

.field public final synthetic b:Lcom/google/android/exoplayer2/n;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/hk0$a;Lcom/google/android/exoplayer2/n;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bkd;->a:Ll/hk0$a;

    iput-object p2, p0, Ll/bkd;->b:Lcom/google/android/exoplayer2/n;

    iput p3, p0, Ll/bkd;->c:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bkd;->a:Ll/hk0$a;

    iget-object v1, p0, Ll/bkd;->b:Lcom/google/android/exoplayer2/n;

    iget p0, p0, Ll/bkd;->c:I

    check-cast p1, Ll/hk0;

    invoke-static {v0, v1, p0, p1}, Ll/wld;->a1(Ll/hk0$a;Lcom/google/android/exoplayer2/n;ILl/hk0;)V

    return-void
.end method
