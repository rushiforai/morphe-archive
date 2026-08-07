.class public final synthetic Ll/ri60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/si60;

.field public final synthetic b:Lv/VMaterialEdit;


# direct methods
.method public synthetic constructor <init>(Ll/si60;Lv/VMaterialEdit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ri60;->a:Ll/si60;

    iput-object p2, p0, Ll/ri60;->b:Lv/VMaterialEdit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ri60;->a:Ll/si60;

    iget-object p0, p0, Ll/ri60;->b:Lv/VMaterialEdit;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/si60;->g0(Ll/si60;Lv/VMaterialEdit;Ljava/lang/Throwable;)V

    return-void
.end method
