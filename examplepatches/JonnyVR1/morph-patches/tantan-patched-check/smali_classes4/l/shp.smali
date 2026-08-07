.class public final synthetic Ll/shp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hjp;


# direct methods
.method public synthetic constructor <init>(Ll/hjp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/shp;->a:Ll/hjp;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/shp;->a:Ll/hjp;

    invoke-static {p0}, Ll/hjp;->z0(Ll/hjp;)V

    return-void
.end method
