.class public final synthetic Ll/vk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/dl0;


# direct methods
.method public synthetic constructor <init>(Ll/dl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vk0;->a:Ll/dl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vk0;->a:Ll/dl0;

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Ll/dl0;->x(Ll/dl0;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method
