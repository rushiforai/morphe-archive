.class public final synthetic Ll/a2h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lv/VMaterialEdit;

.field public final synthetic b:Lv/VButton_FakeShadowSmall;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lv/VMaterialEdit;


# direct methods
.method public synthetic constructor <init>(Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lcom/p1/mobile/android/app/Act;Lv/VMaterialEdit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2h;->a:Lv/VMaterialEdit;

    iput-object p2, p0, Ll/a2h;->b:Lv/VButton_FakeShadowSmall;

    iput-object p3, p0, Ll/a2h;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/a2h;->d:Lv/VMaterialEdit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a2h;->a:Lv/VMaterialEdit;

    iget-object v1, p0, Ll/a2h;->b:Lv/VButton_FakeShadowSmall;

    iget-object v2, p0, Ll/a2h;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/a2h;->d:Lv/VMaterialEdit;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/k3h;->u(Lv/VMaterialEdit;Lv/VButton_FakeShadowSmall;Lcom/p1/mobile/android/app/Act;Lv/VMaterialEdit;Ll/uxj0;)V

    return-void
.end method
