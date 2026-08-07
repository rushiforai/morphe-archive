.class public final synthetic Ll/z9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lag;


# direct methods
.method public synthetic constructor <init>(Ll/lag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z9g;->a:Ll/lag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z9g;->a:Ll/lag;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/lag;->m4(Ll/lag;Ljava/lang/Integer;)V

    return-void
.end method
