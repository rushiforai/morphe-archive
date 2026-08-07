.class public final synthetic Ll/zdw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dew;


# direct methods
.method public synthetic constructor <init>(Ll/dew;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zdw;->a:Ll/dew;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zdw;->a:Ll/dew;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Ll/dew;->d(Ll/dew;Ljava/lang/CharSequence;)V

    return-void
.end method
