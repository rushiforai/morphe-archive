.class public Ll/wk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v8r;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/r8r;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/r8r$a;

    .line 7
    .line 8
    sget v1, Ll/cbc0;->R:I

    .line 9
    .line 10
    const-string v2, "20"

    .line 11
    .line 12
    invoke-direct {v0, v2, v1}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const v1, -0x67e57a

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/16 v1, -0x2f07

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/newui/label/CommonLabelTag;->SEX_AGE_FEMALE:Lcom/p1/mobile/putong/newui/label/CommonLabelTag;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/r8r$a;

    .line 42
    .line 43
    sget v1, Ll/cbc0;->S:I

    .line 44
    .line 45
    invoke-direct {v0, v2, v1}, Ll/r8r$a;-><init>(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    const v1, -0xf5a287

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/r8r$a;->d(I)Ll/r8r$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const v1, -0x531401

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/r8r$a;->b(I)Ll/r8r$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/newui/label/CommonLabelTag;->SEX_AGE_MALE:Lcom/p1/mobile/putong/newui/label/CommonLabelTag;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/r8r$a;->c(Ll/zvl;)Ll/r8r$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ll/r8r$a;->a()Ll/r8r;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    return-object p0
.end method

.method public b()Lcom/p1/mobile/android/ui/label/LabelModule;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/ui/label/LabelModule;->COMMON:Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 2
    .line 3
    return-object p0
.end method
