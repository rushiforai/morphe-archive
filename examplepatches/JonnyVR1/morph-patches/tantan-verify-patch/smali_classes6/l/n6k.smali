.class public final synthetic Ll/n6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/location/Address;


# direct methods
.method public synthetic constructor <init>(Landroid/location/Address;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n6k;->a:Landroid/location/Address;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6k;->a:Landroid/location/Address;

    check-cast p1, Ll/g90;

    invoke-static {p0, p1}, Ll/o6k;->f(Landroid/location/Address;Ll/g90;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
