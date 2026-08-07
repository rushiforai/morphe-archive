.class public final synthetic Ll/az3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hz3;


# direct methods
.method public synthetic constructor <init>(Ll/hz3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/az3;->a:Ll/hz3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/az3;->a:Ll/hz3;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/hz3;->J3(Ll/hz3;Landroid/net/NetworkInfo;)V

    return-void
.end method
