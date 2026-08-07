.class public final synthetic Ll/g9o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r9o;


# direct methods
.method public synthetic constructor <init>(Ll/r9o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g9o;->a:Ll/r9o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9o;->a:Ll/r9o;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/r9o;->x3(Ll/r9o;Landroid/util/Pair;)V

    return-void
.end method
