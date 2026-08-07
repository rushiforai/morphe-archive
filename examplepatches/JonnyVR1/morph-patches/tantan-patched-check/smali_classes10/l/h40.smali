.class public final synthetic Ll/h40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i40;


# direct methods
.method public synthetic constructor <init>(Ll/i40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h40;->a:Ll/i40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h40;->a:Ll/i40;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/i40;->M3(Ll/i40;Ljava/lang/Long;)V

    return-void
.end method
