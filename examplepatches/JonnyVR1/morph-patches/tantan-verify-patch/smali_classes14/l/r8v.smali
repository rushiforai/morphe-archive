.class public final synthetic Ll/r8v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w8v;


# direct methods
.method public synthetic constructor <init>(Ll/w8v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r8v;->a:Ll/w8v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8v;->a:Ll/w8v;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/w8v;->s2(Ll/w8v;Landroid/util/Pair;)V

    return-void
.end method
