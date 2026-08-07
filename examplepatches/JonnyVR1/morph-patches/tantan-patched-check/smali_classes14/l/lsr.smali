.class public final synthetic Ll/lsr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/msr;


# direct methods
.method public synthetic constructor <init>(Ll/msr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lsr;->a:Ll/msr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lsr;->a:Ll/msr;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {p0, p1}, Ll/msr;->P2(Ll/msr;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
