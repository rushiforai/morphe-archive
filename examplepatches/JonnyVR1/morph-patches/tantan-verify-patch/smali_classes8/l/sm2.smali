.class public final synthetic Ll/sm2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/an2;


# direct methods
.method public synthetic constructor <init>(Ll/an2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sm2;->a:Ll/an2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm2;->a:Ll/an2;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/an2;->f0(Ll/an2;Landroid/util/Pair;)V

    return-void
.end method
