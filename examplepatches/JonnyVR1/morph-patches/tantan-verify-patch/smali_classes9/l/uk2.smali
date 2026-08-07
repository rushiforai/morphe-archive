.class public final synthetic Ll/uk2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vk2;

.field public final synthetic b:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/vk2;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uk2;->a:Ll/vk2;

    iput-object p2, p0, Ll/uk2;->b:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uk2;->a:Ll/vk2;

    iget-object p0, p0, Ll/uk2;->b:Ll/pf60;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/vk2;->e(Ll/vk2;Ll/pf60;Ljava/lang/Boolean;)V

    return-void
.end method
