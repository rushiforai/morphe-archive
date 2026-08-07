.class public final synthetic Ll/dr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jr20;


# direct methods
.method public synthetic constructor <init>(Ll/jr20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dr20;->a:Ll/jr20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dr20;->a:Ll/jr20;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/jr20;->c(Ll/jr20;Ljava/lang/CharSequence;)V

    return-void
.end method
