.class public final Ll/nux0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/h1y0;

.field public final synthetic b:Ll/atx0;


# direct methods
.method public constructor <init>(Ll/atx0;Ll/h1y0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/nux0;->a:Ll/h1y0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/nux0;->b:Ll/atx0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nux0;->b:Ll/atx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nux0;->a:Ll/h1y0;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/atx0;->e(Ll/atx0;Ll/h1y0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nux0;->b:Ll/atx0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/nux0;->a:Ll/h1y0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/h1y0;->g:Lcom/google/android/gms/internal/measurement/zzdw;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ll/atx0;->b(Lcom/google/android/gms/internal/measurement/zzdw;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
