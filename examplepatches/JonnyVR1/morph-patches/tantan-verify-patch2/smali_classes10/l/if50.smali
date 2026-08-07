.class public final synthetic Ll/if50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qf50;


# direct methods
.method public synthetic constructor <init>(Ll/qf50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/if50;->a:Ll/qf50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/if50;->a:Ll/qf50;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/qf50;->L3(Ll/qf50;Landroid/net/NetworkInfo;)V

    return-void
.end method
