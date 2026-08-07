.class public final synthetic Ll/s1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VButton_FakeShadowSmall;

.field public final synthetic b:Lv/VMaterialEdit;


# direct methods
.method public synthetic constructor <init>(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s1h;->a:Lv/VButton_FakeShadowSmall;

    iput-object p2, p0, Ll/s1h;->b:Lv/VMaterialEdit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s1h;->a:Lv/VButton_FakeShadowSmall;

    iget-object p0, p0, Ll/s1h;->b:Lv/VMaterialEdit;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p0, p1}, Ll/k3h;->Q(Lv/VButton_FakeShadowSmall;Lv/VMaterialEdit;Ljava/lang/CharSequence;)V

    return-void
.end method
