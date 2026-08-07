.class public final synthetic Ll/hi60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ii60;


# direct methods
.method public synthetic constructor <init>(Ll/ii60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hi60;->a:Ll/ii60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi60;->a:Ll/ii60;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ii60;->f0(Ll/ii60;Ljava/lang/Throwable;)V

    return-void
.end method
