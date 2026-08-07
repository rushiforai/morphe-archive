.class public final synthetic Ll/vjd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$b;


# instance fields
.field public final synthetic a:Ll/wld;

.field public final synthetic b:Lcom/google/android/exoplayer2/t;


# direct methods
.method public synthetic constructor <init>(Ll/wld;Lcom/google/android/exoplayer2/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vjd;->a:Ll/wld;

    iput-object p2, p0, Ll/vjd;->b:Lcom/google/android/exoplayer2/t;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ll/zri;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vjd;->a:Ll/wld;

    iget-object p0, p0, Ll/vjd;->b:Lcom/google/android/exoplayer2/t;

    check-cast p1, Ll/hk0;

    invoke-static {v0, p0, p1, p2}, Ll/wld;->l1(Ll/wld;Lcom/google/android/exoplayer2/t;Ll/hk0;Ll/zri;)V

    return-void
.end method
