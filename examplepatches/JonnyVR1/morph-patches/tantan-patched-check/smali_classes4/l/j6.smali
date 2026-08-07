.class public final synthetic Ll/j6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/n6;


# direct methods
.method public synthetic constructor <init>(Ll/n6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j6;->a:Ll/n6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j6;->a:Ll/n6;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/n6;->d(Ll/n6;Ljava/lang/CharSequence;)V

    return-void
.end method
