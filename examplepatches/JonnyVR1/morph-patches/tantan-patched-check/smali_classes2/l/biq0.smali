.class public final synthetic Ll/biq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o7h0$c;


# instance fields
.field public final synthetic a:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/biq0;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Ll/o7h0$b;)Ll/o7h0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/biq0;->a:Landroid/content/Context;

    invoke-static {p0, p1}, Landroidx/work/impl/WorkDatabase$a;->a(Landroid/content/Context;Ll/o7h0$b;)Ll/o7h0;

    move-result-object p0

    return-object p0
.end method
