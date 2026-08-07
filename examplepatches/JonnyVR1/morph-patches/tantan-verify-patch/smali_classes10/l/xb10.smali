.class public final synthetic Ll/xb10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dc10;


# direct methods
.method public synthetic constructor <init>(Ll/dc10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xb10;->a:Ll/dc10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xb10;->a:Ll/dc10;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/dc10;->P3(Ll/dc10;Landroid/util/Pair;)V

    return-void
.end method
