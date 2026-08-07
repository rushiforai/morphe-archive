.class public final synthetic Ll/e20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e20;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e20;->a:Ll/x20;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Lcom/p1/mobile/android/app/Act;->X0(Ll/x20;Ljava/lang/Boolean;)V

    return-void
.end method
