.class public final synthetic Ll/cgz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ggz;


# direct methods
.method public synthetic constructor <init>(Ll/ggz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cgz;->a:Ll/ggz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgz;->a:Ll/ggz;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/ggz;->x7(Ll/ggz;Ljava/lang/Integer;)V

    return-void
.end method
