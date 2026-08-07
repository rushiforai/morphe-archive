.class public final Ll/fiy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:J

.field public b:J

.field public final synthetic c:Ll/iiy0;


# direct methods
.method public constructor <init>(Ll/iiy0;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fiy0;->c:Ll/iiy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-wide p2, p0, Ll/fiy0;->a:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/fiy0;->b:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fiy0;->c:Ll/iiy0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/oiy0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/oiy0;-><init>(Ll/fiy0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
