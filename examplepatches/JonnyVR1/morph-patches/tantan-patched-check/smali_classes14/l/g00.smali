.class public final synthetic Ll/g00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r00;


# direct methods
.method public synthetic constructor <init>(Ll/r00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g00;->a:Ll/r00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g00;->a:Ll/r00;

    check-cast p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    invoke-static {p0, p1}, Ll/r00;->K(Ll/r00;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    return-void
.end method
