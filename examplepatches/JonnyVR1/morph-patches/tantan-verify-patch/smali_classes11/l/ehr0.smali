.class public final Ll/ehr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I


# direct methods
.method public synthetic constructor <init>(Ll/dhr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->x()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/ehr0;->a:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/bgw0;->x()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/ehr0;->b:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Ll/ehr0;->c:I

    .line 15
    .line 16
    return-void
.end method
