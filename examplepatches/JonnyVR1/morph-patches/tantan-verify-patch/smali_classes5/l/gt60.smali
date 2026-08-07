.class public final synthetic Ll/gt60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rt60;

.field public final synthetic b:Ljava/lang/Double;


# direct methods
.method public synthetic constructor <init>(Ll/rt60;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gt60;->a:Ll/rt60;

    iput-object p2, p0, Ll/gt60;->b:Ljava/lang/Double;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gt60;->a:Ll/rt60;

    iget-object p0, p0, Ll/gt60;->b:Ljava/lang/Double;

    invoke-static {v0, p0}, Ll/rt60;->j(Ll/rt60;Ljava/lang/Double;)V

    return-void
.end method
