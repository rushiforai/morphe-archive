.class public final synthetic Ll/uii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/xc00;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/xc00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uii0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/uii0;->b:Ll/xc00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uii0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/uii0;->b:Ll/xc00;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/gji0;->O(Ljava/lang/String;Ll/xc00;Ljava/lang/Boolean;)V

    return-void
.end method
