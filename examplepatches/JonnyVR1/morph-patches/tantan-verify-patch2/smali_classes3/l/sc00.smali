.class public final synthetic Ll/sc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sc00;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sc00;->a:Ll/y20;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/tc00;->b(Ll/y20;Ljava/lang/String;)V

    return-void
.end method
