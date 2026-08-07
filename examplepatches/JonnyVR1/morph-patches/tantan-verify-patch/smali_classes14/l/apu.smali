.class public final synthetic Ll/apu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/spu;


# direct methods
.method public synthetic constructor <init>(Ll/spu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/apu;->a:Ll/spu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/apu;->a:Ll/spu;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/spu;->X2(Ll/spu;Ljava/lang/Throwable;)V

    return-void
.end method
