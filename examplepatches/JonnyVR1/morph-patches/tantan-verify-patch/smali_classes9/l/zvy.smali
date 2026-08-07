.class public final synthetic Ll/zvy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/fwy;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/fwy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zvy;->a:Ll/fwy;

    iput-object p2, p0, Ll/zvy;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zvy;->a:Ll/fwy;

    iget-object p0, p0, Ll/zvy;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/fwy;->C0(Ll/fwy;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
