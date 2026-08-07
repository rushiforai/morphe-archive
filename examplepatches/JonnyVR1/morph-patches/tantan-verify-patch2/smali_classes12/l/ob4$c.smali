.class Ll/ob4$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/spr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ob4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ob4;->B0(Ll/ob4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ob4;->H0(Ll/ob4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget-object v3, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 8
    .line 9
    invoke-static {v3}, Ll/ob4;->D0(Ll/ob4;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    sub-long/2addr v1, v3

    .line 14
    invoke-static {v0, v1, v2}, Ll/ob4;->F0(Ll/ob4;J)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 18
    .line 19
    invoke-static {p0}, Ll/ob4;->G0(Ll/ob4;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ob4;->C0(Ll/ob4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    const/16 p1, 0x131

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-static {p0, p1, p2}, Ll/ob4;->Z0(Ll/ob4;II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ob4;->J0(Ll/ob4;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ob4$c;->a:Ll/ob4;

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-static {p0, v0, v1}, Ll/ob4;->E0(Ll/ob4;J)J

    .line 13
    .line 14
    .line 15
    return-void
.end method
