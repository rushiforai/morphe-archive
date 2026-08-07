.class public final synthetic Ll/htm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/itm0;


# direct methods
.method public synthetic constructor <init>(Ll/itm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htm0;->a:Ll/itm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/htm0;->a:Ll/itm0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/itm0;->g0(Ll/itm0;Ljava/lang/Throwable;)V

    return-void
.end method
