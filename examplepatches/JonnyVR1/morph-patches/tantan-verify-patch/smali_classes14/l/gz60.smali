.class public final synthetic Ll/gz60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hz60;


# direct methods
.method public synthetic constructor <init>(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gz60;->a:Ll/hz60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gz60;->a:Ll/hz60;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/hz60;->A(Ll/hz60;Ljava/lang/CharSequence;)V

    return-void
.end method
