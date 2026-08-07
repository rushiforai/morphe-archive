.class public final synthetic Ll/ajd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ljd0;


# direct methods
.method public synthetic constructor <init>(Ll/ljd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ajd0;->a:Ll/ljd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajd0;->a:Ll/ljd0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/ljd0;->r4(Ll/ljd0;Ljava/lang/Integer;)V

    return-void
.end method
