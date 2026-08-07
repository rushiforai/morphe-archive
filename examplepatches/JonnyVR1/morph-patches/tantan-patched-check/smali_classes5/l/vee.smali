.class public final synthetic Ll/vee;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kfe;


# direct methods
.method public synthetic constructor <init>(Ll/kfe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vee;->a:Ll/kfe;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vee;->a:Ll/kfe;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/kfe;->z(Ll/kfe;Ljava/lang/Throwable;)V

    return-void
.end method
