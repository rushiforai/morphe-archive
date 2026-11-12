.class public final synthetic Lnu9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic a:Ln1;

.field public final synthetic b:Lou9;


# direct methods
.method public synthetic constructor <init>(Ln1;Lou9;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnu9;->a:Ln1;

    iput-object p2, p0, Lnu9;->b:Lou9;

    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4

    iget-object p1, p0, Lnu9;->b:Lou9;

    iget-object v0, p1, Lou9;->a:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f

    iget-object p0, p0, Lnu9;->a:Ln1;

    invoke-virtual {p0, p1}, Ln1;->x0(Lou9;)V

    :cond_f
    return-void
.end method
