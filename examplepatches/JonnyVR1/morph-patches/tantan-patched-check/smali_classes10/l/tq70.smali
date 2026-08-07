.class public final synthetic Ll/tq70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fr70;


# direct methods
.method public synthetic constructor <init>(Ll/fr70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tq70;->a:Ll/fr70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tq70;->a:Ll/fr70;

    check-cast p1, Ll/ku70;

    invoke-static {p0, p1}, Ll/fr70;->L3(Ll/fr70;Ll/ku70;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
