.class Ll/tc0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->N6([B[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:[B

.field final synthetic c:J

.field final synthetic d:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;[B[BJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tc0$c;->d:Ll/tc0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tc0$c;->a:[B

    .line 4
    .line 5
    iput-object p3, p0, Ll/tc0$c;->b:[B

    .line 6
    .line 7
    iput-wide p4, p0, Ll/tc0$c;->c:J

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
    .locals 7

    .line 1
    iget-object v0, p0, Ll/tc0$c;->d:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->r2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/tc0$c;->a:[B

    .line 8
    .line 9
    iget-object v3, p0, Ll/tc0$c;->b:[B

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    iget-wide v5, p0, Ll/tc0$c;->c:J

    .line 13
    .line 14
    invoke-interface/range {v1 .. v6}, Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;->OnRealLayoutChange([B[BIJ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
