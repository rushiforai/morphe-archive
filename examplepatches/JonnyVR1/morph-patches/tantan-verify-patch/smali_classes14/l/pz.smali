.class public final synthetic Ll/pz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/r00;


# direct methods
.method public synthetic constructor <init>(Ll/r00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pz;->a:Ll/r00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pz;->a:Ll/r00;

    check-cast p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Ll/r00;->y(Ll/r00;Lcom/momo/mcamera/filtermanager/MMPresetFilter;Ljava/lang/Integer;)V

    return-void
.end method
