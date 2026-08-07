.class public final synthetic Ll/z2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SubGender;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SubGender;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z2n;->a:Lcom/p1/mobile/putong/data/SubGender;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z2n;->a:Lcom/p1/mobile/putong/data/SubGender;

    check-cast p1, Lcom/p1/mobile/putong/data/IntlGenderItem;

    invoke-static {p0, p1}, Ll/b3n;->a(Lcom/p1/mobile/putong/data/SubGender;Lcom/p1/mobile/putong/data/IntlGenderItem;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
