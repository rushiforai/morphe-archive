.class public final synthetic Ll/yvk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zvk0;


# direct methods
.method public synthetic constructor <init>(Ll/zvk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yvk0;->a:Ll/zvk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yvk0;->a:Ll/zvk0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/zvk0;->S2(Ll/zvk0;Ljava/lang/Throwable;)V

    return-void
.end method
