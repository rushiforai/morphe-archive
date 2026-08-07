.class public final synthetic Ll/wdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cen;


# direct methods
.method public synthetic constructor <init>(Ll/cen;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdn;->a:Ll/cen;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wdn;->a:Ll/cen;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/cen;->i(Ll/cen;Ljava/lang/CharSequence;)V

    return-void
.end method
