.class public final synthetic Ll/en00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jn00;


# direct methods
.method public synthetic constructor <init>(Ll/jn00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/en00;->a:Ll/jn00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en00;->a:Ll/jn00;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/jn00;->a(Ll/jn00;Ljava/lang/CharSequence;)V

    return-void
.end method
