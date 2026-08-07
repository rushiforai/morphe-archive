.class Ll/voq$q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->updateByteDanceFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:F

.field final synthetic d:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/voq$q;->d:Ll/voq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/voq$q;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/voq$q;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput p4, p0, Ll/voq$q;->c:F

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/voq$q;->d:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->S1(Ll/voq;)Ll/s1f;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/voq$q;->d:Ll/voq;

    .line 10
    .line 11
    invoke-static {v0}, Ll/voq;->S1(Ll/voq;)Ll/s1f;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/voq$q;->a:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, p0, Ll/voq$q;->b:Ljava/lang/String;

    .line 18
    .line 19
    iget p0, p0, Ll/voq$q;->c:F

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2, p0}, Ll/s1f;->h(Ljava/lang/String;Ljava/lang/String;F)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
