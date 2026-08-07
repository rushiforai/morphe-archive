.class public final synthetic Ll/k170;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l170;


# direct methods
.method public synthetic constructor <init>(Ll/l170;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k170;->a:Ll/l170;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k170;->a:Ll/l170;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/l170;->a(Ll/l170;Ljava/lang/CharSequence;)V

    return-void
.end method
